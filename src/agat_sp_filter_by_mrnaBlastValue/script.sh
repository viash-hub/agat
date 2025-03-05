#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_filter_by_mrnaBlastValue.pl \
  --gff "$par_gff" \
  --blast "$par_blast" \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
