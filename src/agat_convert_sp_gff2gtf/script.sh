#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_convert_sp_gff2gtf.pl \
  --gff "$par_gff" \
  --gtf_version "$par_gtf_version" \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"} \
  ${par_verbose:+--verbose}
