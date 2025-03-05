#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_exclude" == "false" ]] && unset par_exclude
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sp_filter_record_by_coordinates.pl \
  --input "$par_input" \
  --coordinates "$par_coordinates" \
  ${par_exclude:+--exclude} \
  --output "$par_output" \
  ${par_verbose:+--verbose} \
  ${par_config:+--config "$par_config"}
