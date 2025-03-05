#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sq_add_hash_tag.pl \
  --input "$par_input" \
  ${par_interval:+--interval "$par_interval"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
