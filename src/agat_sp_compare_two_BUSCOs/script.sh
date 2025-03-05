#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_compare_two_BUSCOs.pl \
  --f1 "$par_f1" \
  --f2 "$par_f2" \
  --verbose "$par_verbose" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
