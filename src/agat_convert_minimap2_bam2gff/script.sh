#!/bin/bash

## VIASH START
## VIASH END

# run command
agat_convert_minimap2_bam2gff.pl \
  --input "$par_input" \
  ${par_bam:+--bam "$par_bam"} \
  ${par_sam:+--sam "$par_sam"} \
  --output "$par_output" \
  ${par_config:+--config "$par_config"}
