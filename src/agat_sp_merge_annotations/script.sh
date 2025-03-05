#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_merge_annotations.pl \
  --gff "$par_gff" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
