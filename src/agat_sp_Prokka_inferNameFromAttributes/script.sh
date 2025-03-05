#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_force" == "false" ]] && unset par_force

# run command
agat_sp_Prokka_inferNameFromAttributes.pl \
  --gff "$par_gff" \
  ${par_force:+--force} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
