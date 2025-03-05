#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_fix_small_exon_from_extremities.pl \
  -gff "$par_gff" \
  --fasta "$par_fasta" \
  ${par_codon:+--codon "$par_codon"} \
  ${par_size:+--size "$par_size"} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
