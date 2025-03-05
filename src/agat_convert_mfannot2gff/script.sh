#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_convert_mfannot2gff.pl \
  --mfannot "$par_mfannot" \
  --gff "$par_gff" \
  ${par_config:+--config "$par_config"} \
  ${par_verbose:+--verbose}
