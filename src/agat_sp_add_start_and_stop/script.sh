#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_extend" == "false" ]] && unset par_extend
[[ "$par_na" == "false" ]] && unset par_na
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sp_add_start_and_stop.pl.pl \
  --gff "$par_gff" \
  --fasta "$par_fasta" \
  ${par_codon:+--codon "$par_codon"} \
  --output "$par_output" \
  ${par_extend:+--extend} \
  ${par_na:+--na} \
  ${par_verbose:+--verbose} \
  ${par_config:+--config "$par_config"}
