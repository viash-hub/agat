#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose
[[ "$par_plot" == "false" ]] && unset par_plot

# run command
agat_sp_kraken_assess_lift_coverage.pl \
  -gtf "$par_gtf" \
  --threshold "$par_threshold" \
  ${par_verbose:+--verbose} \
  ${par_plot:+--plot} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
