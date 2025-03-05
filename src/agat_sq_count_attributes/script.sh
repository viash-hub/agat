#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sq_count_attributes.pl \
  --gff "$par_gff" \
  ${par_att:+--att "$par_att"} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
