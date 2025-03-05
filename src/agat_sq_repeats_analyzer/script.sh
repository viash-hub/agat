#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sq_repeats_analyzer.pl \
  --input "$par_input" \
  --genome "$par_genome" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
