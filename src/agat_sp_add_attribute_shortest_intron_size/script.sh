#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sp_add_attribute_shortest_intron_size.pl \
  --reffile "$par_reffile" \
  --output "$par_output" \
  ${par_verbose:+--verbose} \
  ${par_config:+--config "$par_config"}
