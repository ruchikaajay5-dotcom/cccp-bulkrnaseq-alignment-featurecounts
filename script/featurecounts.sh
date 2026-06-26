#!/bin/bash

mkdir -p results/counts

featureCounts \
-T 4 \
-p \
-t exon \
-g gene_id \
-a reference/annotation.gtf \
-o results/counts/gene_counts.txt \
results/alignment/*.sorted.bam
