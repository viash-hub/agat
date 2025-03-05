#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_merge" == "false" ]] && unset par_merge
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sp_fix_overlaping_genes.pl \
  --file "$par_file" \
  ${par_merge:+--merge} \
  --outfile "$par_outfile" \
  ${par_verbose:+--verbose} \
  ${par_config:+--config "$par_config"}
