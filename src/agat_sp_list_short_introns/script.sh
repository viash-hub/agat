#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_list_short_introns.pl \
  -reffile "$par_reffile" \
  ${par_size:+--size "$par_size"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
