#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_add_splice_sites.pl \
  -reffile "$par_reffile" \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
