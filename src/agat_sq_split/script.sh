#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sq_split.pl \
  --input "$par_input" \
  ${par_interval:+--interval "$par_interval"} \
  ${par_feature_type:+--feature_type "$par_feature_type"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
