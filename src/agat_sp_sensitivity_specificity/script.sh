#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_sensitivity_specificity.pl \
  -gff1 "$par_gff1" \
  -gff2 "$par_gff2" \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
