#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_filter_by_ORF_size.pl \
  --gff "$par_gff" \
  ${par_size:+--size "$par_size"} \
  --test "$par_test" \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
