#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_convert_sp_gff2tsv.pl \
  --gff "$par_gff" \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
