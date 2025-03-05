#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_flip" == "false" ]] && unset par_flip

# run command
agat_sp_filter_feature_by_attribute_presence.pl \
  --reffile "$par_reffile" \
  --type "$par_type" \
  --attribute "$par_attribute" \
  ${par_flip:+--flip} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
