#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_value_insensitive" == "false" ]] && unset par_value_insensitive
[[ "$par_keep_parental" == "false" ]] && unset par_keep_parental

# run command
agat_sp_filter_feature_by_attribute_value.pl \
  --reffile "$par_reffile" \
  --attribute "$par_attribute" \
  --type "$par_type" \
  --value "$par_value" \
  ${par_value_insensitive:+--value_insensitive} \
  ${par_na_aside:+--na_aside "$par_na_aside"} \
  ${par_keep_parental:+--keep_parental} \
  ${par_test:+--test "$par_test"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
