#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_filter_gene_by_intron_numbers.pl \
  --reffile "$par_reffile" \
  ${par_number:+--number "$par_number"} \
  ${par_test:+--test "$par_test"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
