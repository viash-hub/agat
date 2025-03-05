#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sp_add_intergenic_regions.pl \
  --gff "$par_gff" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"} \
  ${par_verbose:+--verbose}
