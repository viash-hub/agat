#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_functional_statistics.pl \
  --gff "$par_gff" \
  --gs "$par_gs" \
  ${par_output:+--output "$par_output"} \
  ${par_config:+--config "$par_config"}
