#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_add" == "false" ]] && unset par_add
[[ "$par_cp" == "false" ]] && unset par_cp
[[ "$par_overwrite" == "false" ]] && unset par_overwrite

# run command
agat_sp_manage_attributes.pl \
  --gff "$par_gff" \
  --type "$par_type" \
  --att "$par_att" \
  ${par_add:+--add} \
  ${par_cp:+--cp} \
  ${par_overwrite:+--overwrite} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
