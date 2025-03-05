#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_d" == "false" ]] && unset par_d

# run command
agat_sp_extract_attributes.pl \
  --gff "$par_gff" \
  -l "$par_l" \
  --attribute "$par_attribute" \
  ${par_merge:+--merge "$par_merge"} \
  ${par_d:+-d} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
