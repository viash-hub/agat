#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_convert_sp_gff2zff.pl \
  --gff "$par_gff" \
  --fasta "$par_fasta" \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
