library(tidyverse)

config_files <- list.files(
  "src",
  pattern = ".vsh.yaml$",
  recursive = TRUE,
  full.names = TRUE
)

walk(config_files, function(config_file) {
  cat("Processing", config_file, "\n")
  config <- yaml::read_yaml(config_file)

  args <- map(config$arguments, function(arg) {
    arg$clean_name <- str_replace_all(arg$name, "^--?", "")
    arg
  })

  # generate code for unset flags
  unset_flags <-
    map_chr(args, function(arg) {
      if (arg$type == "boolean_true" || arg$type == "boolean_false") {
        cond_val <- if (arg$type == "boolean_true") "false" else "true"
        paste0(
          "[[ \"$par_",
          arg$clean_name,
          "\" == \"",
          cond_val,
          "\" ]] && unset par_",
          arg$clean_name
        )
      } else {
        NA_character_
      }
    }) |>
    discard(is.na)
  unset_flags_vec <-
    if (length(unset_flags) > 0) {
      c("## unset flags", unset_flags, "")
    } else {
      c()
    }

  # generate code for setting flags
  argument_strings <-
    map_chr(args, function(arg) {
      if (arg$type == "boolean_true" || arg$type == "boolean_false") {
        paste0("  ${par_", arg$clean_name, ":+", arg$name, "}")
      } else if (arg$required) {
        paste0("  ", arg$name, " \"$par_", arg$clean_name, "\"")
      } else {
        paste0(
          "  ${par_",
          arg$clean_name,
          ":+",
          arg$name,
          " \"$par_",
          arg$clean_name,
          "\"}"
        )
      }
    })
  command_vec <- c(config$requirements$commands, argument_strings)

  bash_script <- c(
    "#!/bin/bash",
    "",
    "## VIASH START",
    "## VIASH END",
    "",
    unset_flags_vec,
    "# run command",
    paste0(head(command_vec, -1), " \\"),
    tail(command_vec, 1)
  )

  write_lines(bash_script, file.path("src", config$name, "script.sh"))
})
