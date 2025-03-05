#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_plot" == "false" ]] && unset par_plot

# run command
agat_sp_manage_introns.pl \
  -reffile "$par_reffile" \
  --breaks "$par_breaks" \
  ${par_p:+--p "$par_p"} \
  ${par_plot:+--plot} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
