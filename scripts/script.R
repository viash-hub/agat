library(tidyverse)

# Clone the repository
url <- "https://github.com/NBISweden/AGAT.git"
system(paste("git clone", url))

# look fir pl files in bin/
pl_files <- list.files("AGAT/bin", pattern = "*.pl", full.names = TRUE)

out <- map(pl_files, function(pl_file) {
  cat("Processing", pl_file, "\n")
  component_name <- str_remove(basename(pl_file), "\\.pl$")

  # Read the file
  lines <- read_lines(pl_file)

  # identify parser
  # format: GetOptions(..., ..., ...)
  parser_lines <- lines |>
    str_c(collapse = "\n") |>
    str_extract("GetOptions *\\(([^)]*)\\)") |>
    str_remove("^GetOptions *\\(") |>
    str_remove("\\)$") |>
    str_split("\n") |>
    unlist() |>
    str_remove_all("[\n,]") |>
    str_trim()
  loc_get_opts <- grep("GetOptions *\\(", lines)[[1]]

  parser_args <- map_dfr(parser_lines, function(parser_line) {
    if (!grepl("=>", parser_line)) {
      return(NULL)
    }
    first_string <- parser_line |>
      str_extract("^\"[^\"]*\"|^'[^']*'") |>
      str_remove_all("[\"']")

    # first_string examples:
    # file|input|gff=s
    # csv!
    # n|t|nb|number=i

    names <- first_string |>
      str_extract("([a-zA-Z0-9_\\|]+)") |>
      str_split("\\|") |>
      unlist()

    # extract type
    type <- first_string |>
      str_extract("=[a-zA-Z]|!") |>
      str_remove("=") |>
      str_to_lower()

    # extract variable name
    variable_name <- str_replace(parser_line, ".*=>", "") |>
      str_remove_all("[^a-zA-Z0-9_]+")

    # try to check for defaults
    default <-
      grep(
        paste0("my .", variable_name, " *="),
        lines[seq_len(loc_get_opts)],
        value = TRUE
      ) |>
      str_extract("=.*;") |>
      str_remove_all("[=;]") |>
      str_trim()

    li <- lst(
      component_name,
      names = list(names),
      type,
      variable_name,
      default
    )
    for (i in seq_along(li)) {
      if (is.null(li[[i]]) || length(li[[i]]) == 0) {
        li[[i]] <- NA
      }
    }
    as_tibble(li)
  })

  # identify header lines
  header_ix <- c(which(grepl("^=head1", lines)), length(lines) + 1)

  # extract metadata
  metadata <- as.list(unlist(map(seq_len(length(header_ix) - 1), function(i) {
    header_i <- header_ix[i]
    header_lines <- lines[(header_i + 1):(header_ix[i + 1] - 1)]

    name <- lines[header_i] |>
      str_remove("^=head1\\s+") |>
      str_to_lower() |>
      str_trim()

    # replace header lines with markdown
    header_lines <- header_lines |>
      str_replace("^=head2", "##") |>
      str_replace("^=head3", "###") |>
      str_replace("^=head4", "####") |>
      str_replace("^=head5", "#####") |>
      str_replace("^=head6", "######") |>
      str_replace("^=item", "*") |>
      str_replace("^=over", "") |>
      str_replace("^=back", "")

    text <- header_lines |>
      str_remove("^\\s+") |>
      str_c(collapse = "\n") |>
      str_trim()

    setNames(text, name)
  })))

  # parse options
  option_lines <- str_split(metadata$options, "\n")[[1]]

  option_ix <- which(grepl("^\\*  *B<", option_lines)) |>
    c(length(option_lines) + 1)

  doc_args <- map_dfr(seq_len(length(option_ix) - 1), function(i) {
    st <- option_ix[i]
    end <- option_ix[i + 1] - 1

    names <- option_lines[st] |>
      str_extract_all("B<([^>]*)>") |>
      unlist() |>
      str_replace_all("B<([^>]*)>", "\\1")

    desc <- option_lines[(st + 1):end] |>
      str_remove("^\\s+") |>
      str_c(collapse = " ") |>
      str_trim()

    li <- lst(
      component_name,
      names = list(names),
      desc
    )
    for (i in seq_along(li)) {
      if (is.null(li[[i]]) || length(li[[i]]) == 0) {
        li[[i]] <- NA
      }
    }
    as_tibble(li)
  })

  sort_get_longest <- function(x) {
    xs <- x |> sort()
    xs[[which.max(str_length(xs))]]
  }

  parser_arg_names <- parser_args$names
  parser_arg_names_longest <- parser_arg_names |> map_chr(sort_get_longest)
  doc_arg_names <- doc_args$names |> map(str_replace_all, "^-*", "")
  doc_arg_names_longest <- doc_arg_names |> map_chr(sort_get_longest)

  overlap_mat <-
    crossing(
      i = seq_along(parser_arg_names),
      j = seq_along(doc_arg_names)
    ) |>
    mutate(
      jaccard = map2_dbl(i, j, function(i, j) {
        length(intersect(parser_arg_names[[i]], doc_arg_names[[j]])) /
          length(union(parser_arg_names[[i]], doc_arg_names[[j]]))
      })
    ) |>
    reshape2::acast(i ~ j, value.var = "jaccard")
  rownames(overlap_mat) <- parser_arg_names_longest
  colnames(overlap_mat) <- doc_arg_names_longest

  num_match_per_row <- apply(overlap_mat, 1, function(x) sum(x >= 0.5))
  # remove verbose and quiet
  num_match_per_row <- num_match_per_row[
    !names(num_match_per_row) %in% c("v", "verbose", "quiet")
  ]
  if (any(num_match_per_row > 1) || any(num_match_per_row == 0)) {
    print(num_match_per_row)
    stop("Incorrect matches found! Please check file manually:\n", pl_file)
  }
  num_match_per_col <- apply(overlap_mat, 2, function(x) sum(x >= 0.5))
  # remove verbose and quiet
  num_match_per_col <- num_match_per_col[
    !names(num_match_per_col) %in% c("v", "verbose", "quiet")
  ]
  if (any(num_match_per_col > 1) || any(num_match_per_col == 0)) {
    print(num_match_per_col)
    stop("Incorrect matches found! Please check file manually:\n", pl_file)
  }
  matching <- which(overlap_mat >= 0.5, arr.ind = TRUE)

  args <- bind_cols(
    parser_args |> slice(matching[, 1]) |> rename(names_parser = names),
    doc_args |>
      slice(matching[, 2]) |>
      select(-component_name) |>
      rename(names_doc = names)
  ) |>
    mutate(
      jaccard = overlap_mat[matching],
      name = map_chr(names_parser, sort_get_longest),
      alternatives = map2(names_parser, name, setdiff)
    )

  list(
    name = component_name,
    args = args,
    metadata = as_tibble(metadata) |> mutate(component_name)
  )
})

metadata <- map_dfr(out, "metadata")
args <- map_dfr(out, "args") |>
  mutate(
    desc_lc = str_to_lower(desc),
    has_default = grepl("\\[default:", desc_lc),
    has_example = grepl("example", desc_lc),
    type = case_when(
      grepl("integer", desc_lc) ~ "integer",
      grepl("float", desc_lc) ~ "float",
      grepl("file", desc_lc) ~ "file",
      grepl("string", desc_lc) ~ "string",
      grepl("boolean|bolean", desc_lc) ~ "boolean",
      TRUE ~ "unknown"
    ),
    is_multiple = grepl("multiple", desc_lc),
    output = grepl("output", desc_lc) | grepl("output", desc_lc)
  ) |>
  select(-desc_lc)
