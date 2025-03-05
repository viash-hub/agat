#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_quiet" == "false" ]] && unset par_quiet

# run command
agat_sq_add_locus_tag.pl \
  --input "$par_input" \
  --type "$par_type" \
  ${par_lo:+--lo "$par_lo"} \
  --li "$par_li" \
  --output "$par_output" \
  ${par_quiet:+--quiet} \
  ${par_config:+--config "$par_config"}
