#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_sp_clipN_seqExtremities_and_fixCoordinates.pl \
  --gff "$par_gff" \
  --fasta "$par_fasta" \
  --of "$par_of" \
  --og "$par_og" \
  ${par_config:+--config "$par_config"}
