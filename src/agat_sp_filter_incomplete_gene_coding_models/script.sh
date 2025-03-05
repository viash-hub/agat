#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_skip_start_check" == "false" ]] && unset par_skip_start_check
[[ "$par_skip_stop_check" == "false" ]] && unset par_skip_stop_check

# run command
agat_sp_filter_incomplete_gene_coding_models.pl \
  -gff "$par_gff" \
  --fasta "$par_fasta" \
  ${par_codon:+--codon "$par_codon"} \
  ${par_add_flag:+--add_flag "$par_add_flag"} \
  ${par_skip_start_check:+--skip_start_check} \
  ${par_skip_stop_check:+--skip_stop_check} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
