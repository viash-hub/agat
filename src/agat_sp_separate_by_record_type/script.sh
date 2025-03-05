#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_separate_by_record_type.pl \
  --gff "$par_gff" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
