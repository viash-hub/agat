#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_complement_annotations.pl \
  --ref "$par_ref" \
  --add "$par_add" \
  ${par_size_min:+--size_min "$par_size_min"} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
