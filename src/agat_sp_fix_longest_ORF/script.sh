#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_split" == "false" ]] && unset par_split

# run command
agat_sp_fix_longest_ORF.pl \
  --gff "$par_gff" \
  --fasta "$par_fasta" \
  ${par_codon:+--codon "$par_codon"} \
  --model "$par_model" \
  ${par_split:+--split} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
