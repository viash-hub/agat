#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_filter_by_locus_distance.pl \
  -gff "$par_gff" \
  ${par_dist:+--dist "$par_dist"} \
  ${par_add_flag:+--add_flag "$par_add_flag"} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
