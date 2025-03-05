#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sq_list_attributes.pl \
  --gff "$par_gff" \
  -l "$par_l" \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
