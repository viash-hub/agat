#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_flag_short_introns.pl \
  -reffile "$par_reffile" \
  ${par_intron_size:+--intron_size "$par_intron_size"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
