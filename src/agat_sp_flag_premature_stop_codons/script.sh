#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_flag_premature_stop_codons.pl \
  -reffile "$par_reffile" \
  --fasta "$par_fasta" \
  ${par_codon:+--codon "$par_codon"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
