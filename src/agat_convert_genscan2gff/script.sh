#!/bin/bash

## VIASH START
## VIASH END

## unset flags
[[ "$par_verbose" == "false" ]] && unset par_verbose

# run command
agat_convert_genscan2gff.pl \
  --genscan "$par_genscan" \
  ${par_seqid:+--seqid "$par_seqid"} \
  ${par_verbose:+--verbose} \
  --outfile "$par_outfile" \
  ${par_config:+--config "$par_config"}
