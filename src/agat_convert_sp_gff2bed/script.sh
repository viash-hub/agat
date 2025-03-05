#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_convert_sp_gff2bed.pl \
  --gff "$par_gff" \
  ${par_nc:+--nc "$par_nc"} \
  ${par_sub:+--sub "$par_sub"} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
