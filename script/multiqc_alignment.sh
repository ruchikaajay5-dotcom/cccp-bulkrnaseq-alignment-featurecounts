#!/bin/bash

mkdir -p results/multiqc_alignment

multiqc \
results/alignment \
results/counts \
-o results/multiqc_alignment
