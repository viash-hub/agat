#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_move_attributes_within_records.pl \
  --reffile "$par_reffile" \
  ${par_feature_copy:+--feature_copy "$par_feature_copy"} \
  ${par_feature_paste:+--feature_paste "$par_feature_paste"} \
  ${par_attribute:+--attribute "$par_attribute"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
