#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose
[[ "$par_raw" == "false" ]] && unset par_raw
[[ "$par_yaml" == "false" ]] && unset par_yaml

# run command
agat_sp_statistics.pl \
  --gff "$par_gff" \
  --gs "$par_gs" \
  ${par_d:+-d "$par_d"} \
  ${par_verbose:+--verbose} \
  --output "$par_output" \
  ${par_percentile:+--percentile "$par_percentile"} \
  ${par_raw:+--raw} \
  ${par_yaml:+--yaml} \
  ${par_config:+--config "$par_config"}
