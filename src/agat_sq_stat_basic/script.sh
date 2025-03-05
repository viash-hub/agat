#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_inflate" == "false" ]] && unset par_inflate

# run command
agat_sq_stat_basic.pl \
  --input "$par_input" \
  --genome "$par_genome" \
  ${par_inflate:+--inflate} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
