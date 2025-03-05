#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_sm" == "false" ]] && unset par_sm
[[ "$par_hm" == "false" ]] && unset par_hm

# run command
agat_sq_mask.pl \
  --gff "$par_gff" \
  --fasta "$par_fasta" \
  ${par_sm:+-sm} \
  ${par_hm:+-hm} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
