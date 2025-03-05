#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sp_fix_cds_phases.pl \
  --gff "$par_gff" \
  --fasta "$par_fasta" \
  ${par_verbose:+--verbose} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
