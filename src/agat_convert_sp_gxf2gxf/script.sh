#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_convert_sp_gxf2gxf.pl \
  --gff "$par_gff" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
