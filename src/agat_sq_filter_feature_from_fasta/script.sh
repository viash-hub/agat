#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sq_filter_feature_from_fasta.pl \
  --input "$par_input" \
  --fasta "$par_fasta" \
  ${par_verbose:+--verbose} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
