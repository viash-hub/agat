#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_keep_longest_isoform.pl \
  --gff "$par_gff" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
