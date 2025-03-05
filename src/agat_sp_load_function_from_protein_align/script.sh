#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_method" == "false" ]] && unset par_method
[[ "$par_w" == "false" ]] && unset par_w
[[ "$par_pe" == "false" ]] && unset par_pe
[[ "$par_sp" == "false" ]] && unset par_sp

# run command
agat_sp_load_function_from_protein_align.pl \
  --annotation "$par_annotation" \
  --pgff "$par_pgff" \
  --pfasta "$par_pfasta" \
  ${par_method:+--method} \
  ${par_threshold:+--threshold "$par_threshold"} \
  ${par_w:+-w} \
  ${par_pe:+--pe} \
  ${par_test:+--test "$par_test"} \
  ${par_sp:+--sp} \
  ${par_priority:+--priority "$par_priority"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
