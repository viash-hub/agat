#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sq_manage_ID.pl \
  --input "$par_input" \
  --of "$par_of" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
