#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_frags" == "false" ]] && unset par_frags
[[ "$par_pseudo" == "false" ]] && unset par_pseudo
[[ "$par_skip_hamap" == "false" ]] && unset par_skip_hamap

# run command
agat_sp_prokka_fragmented_gene_annotations.pl \
  --gff "$par_gff" \
  --fasta "$par_fasta" \
  --db "$par_db" \
  ${par_frags:+--frags} \
  ${par_pseudo:+--pseudo} \
  ${par_hamap_size:+--hamap_size "$par_hamap_size"} \
  ${par_codon:+--codon "$par_codon"} \
  ${par_skip_hamap:+--skip_hamap} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
