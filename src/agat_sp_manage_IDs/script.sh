#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_ensembl" == "false" ]] && unset par_ensembl
[[ "$par_type_dependent" == "false" ]] && unset par_type_dependent
[[ "$par_collective" == "false" ]] && unset par_collective
[[ "$par_tair" == "false" ]] && unset par_tair

# run command
agat_sp_manage_IDs.pl \
  --gff "$par_gff" \
  ${par_gap:+--gap "$par_gap"} \
  ${par_ensembl:+--ensembl} \
  --prefix "$par_prefix" \
  ${par_type_dependent:+--type_dependent} \
  ${par_collective:+--collective} \
  ${par_tair:+--tair} \
  ${par_nb:+--nb "$par_nb"} \
  ${par_l:+-l "$par_l"} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
