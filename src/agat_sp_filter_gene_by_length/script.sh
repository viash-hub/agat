#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_filter_gene_by_length.pl \
  --reffile "$par_reffile" \
  ${par_size:+--size "$par_size"} \
  ${par_test:+--test "$par_test"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
