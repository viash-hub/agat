#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_alternative_start_codon" == "false" ]] && unset par_alternative_start_codon
[[ "$par_cdna" == "false" ]] && unset par_cdna
[[ "$par_clean_final_stop" == "false" ]] && unset par_clean_final_stop
[[ "$par_clean_internal_stop" == "false" ]] && unset par_clean_internal_stop
[[ "$par_eo" == "false" ]] && unset par_eo
[[ "$par_full" == "false" ]] && unset par_full
[[ "$par_keep_attributes" == "false" ]] && unset par_keep_attributes
[[ "$par_keep_parent_attributes" == "false" ]] && unset par_keep_parent_attributes
[[ "$par_merge" == "false" ]] && unset par_merge
[[ "$par_mrna" == "false" ]] && unset par_mrna
[[ "$par_plus_strand_only" == "false" ]] && unset par_plus_strand_only
[[ "$par_protein" == "false" ]] && unset par_protein
[[ "$par_remove_orf_offset" == "false" ]] && unset par_remove_orf_offset
[[ "$par_revcomp" == "false" ]] && unset par_revcomp
[[ "$par_split" == "false" ]] && unset par_split

# run command
agat_sp_extract_sequences.pl \
  ${par_alternative_start_codon:+--alternative_start_codon} \
  ${par_cdna:+--cdna} \
  ${par_clean_final_stop:+--clean_final_stop} \
  ${par_clean_internal_stop:+--clean_internal_stop} \
  ${par_codon:+--codon "$par_codon"} \
  -downstream "$par_downstream" \
  ${par_eo:+--eo} \
  --fasta "$par_fasta" \
  ${par_full:+--full} \
  --gff "$par_gff" \
  ${par_keep_attributes:+--keep_attributes} \
  ${par_keep_parent_attributes:+--keep_parent_attributes} \
  ${par_merge:+--merge} \
  ${par_mrna:+--mrna} \
  --ofs "$par_ofs" \
  --output "$par_output" \
  ${par_plus_strand_only:+--plus_strand_only} \
  ${par_protein:+--protein} \
  ${par_remove_orf_offset:+--remove_orf_offset} \
  ${par_revcomp:+--revcomp} \
  ${par_split:+--split} \
  ${par_type:+--type "$par_type"} \
  -upstream "$par_upstream" \
  ${par_config:+--config "$par_config"}
