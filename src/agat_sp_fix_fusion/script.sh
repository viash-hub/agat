#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_stranded" == "false" ]] && unset par_stranded
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_sp_fix_fusion.pl \
  -gff "$par_gff" \
  --fasta "$par_fasta" \
  ${par_codon:+--codon "$par_codon"} \
  --threshold "$par_threshold" \
  ${par_stranded:+--stranded} \
  ${par_verbose:+--verbose} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
