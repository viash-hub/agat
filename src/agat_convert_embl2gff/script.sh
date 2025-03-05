#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_d" == "false" ]] && unset par_d
[[ "$par_k" == "false" ]] && unset par_k

# run command
agat_converter_embl2gff.pl \
  --embl "$par_embl" \
  ${par_emblmygff3:+--emblmygff3 "$par_emblmygff3"} \
  --primary_tag "$par_primary_tag" \
  ${par_d:+-d} \
  ${par_k:+-k} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
