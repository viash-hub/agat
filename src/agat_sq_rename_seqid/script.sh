#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sq_rename_seqid.pl \
  --gff "$par_gff" \
  --tsv "$par_tsv" \
  ${par_csv:+--csv "$par_csv"} \
  ${par_verbose:+--verbose} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
