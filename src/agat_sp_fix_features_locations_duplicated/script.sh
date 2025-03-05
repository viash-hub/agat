#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sp_fix_features_locations_duplicated.pl \
  --file "$par_file" \
  --model "$par_model" \
  ${par_verbose:+--verbose} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
