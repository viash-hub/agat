#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_clean_name" == "false" ]] && unset par_clean_name
[[ "$par_clean_product" == "false" ]] && unset par_clean_product
[[ "$par_clean_dbxref" == "false" ]] && unset par_clean_dbxref
[[ "$par_clean_ontology" == "false" ]] && unset par_clean_ontology
[[ "$par_addgntag" == "false" ]] && unset par_addgntag
[[ "$par_pcds" == "false" ]] && unset par_pcds

# run command
agat_sp_manage_functional_annotation.pl \
  --reffile "$par_reffile" \
  --blast "$par_blast" \
  ${par_clean_name:+--clean_name} \
  ${par_clean_product:+--clean_product} \
  ${par_clean_dbxref:+--clean_dbxref} \
  ${par_clean_ontology:+--clean_ontology} \
  --db "$par_db" \
  ${par_blast_evalue:+--blast_evalue "$par_blast_evalue"} \
  ${par_pe:+--pe "$par_pe"} \
  --interpro "$par_interpro" \
  -id "$par_id" \
  -idau "$par_idau" \
  ${par_nb:+-nb "$par_nb"} \
  ${par_addgntag:+--addgntag} \
  --output "$par_output" \
  ${par_pcds:+--pcds} \
  ${par_config:+--config "$par_config"}
