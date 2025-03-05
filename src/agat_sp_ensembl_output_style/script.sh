#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_ensembl_output_style.pl \
  --gff "$par_gff" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
