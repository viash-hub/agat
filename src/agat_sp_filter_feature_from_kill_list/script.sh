#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_filter_feature_from_kill_list.pl \
  --reffile "$par_reffile" \
  --type "$par_type" \
  --kill_list "$par_kill_list" \
  ${par_attribute:+--attribute "$par_attribute"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
