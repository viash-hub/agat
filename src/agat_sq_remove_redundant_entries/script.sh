#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sq_remove_redundant_entries.pl \
  --input "$par_input" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
