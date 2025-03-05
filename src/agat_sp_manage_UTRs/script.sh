#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_tree_prime_utr" == "false" ]] && unset par_tree_prime_utr
[[ "$par_five_prime_utr" == "false" ]] && unset par_five_prime_utr
[[ "$par_both" == "false" ]] && unset par_both
[[ "$par_plot" == "false" ]] && unset par_plot

# run command
agat_sp_manage_UTRs.pl \
  --reffile "$par_reffile" \
  --number "$par_number" \
  ${par_tree_prime_utr:+--tree_prime_utr} \
  ${par_five_prime_utr:+--five_prime_utr} \
  ${par_both:+--both} \
  ${par_plot:+--plot} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
