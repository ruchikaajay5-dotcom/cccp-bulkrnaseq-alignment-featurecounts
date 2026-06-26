#!/bin/bash

# Create output directories

mkdir -p results/alignment
mkdir -p results/alignment/qc

# Loop through all trimmed FASTQ files

for R1 in results/fastq_trimmed/*_1_trimmed.fastq.gz
do

```
R2=${R1/_1_trimmed.fastq.gz/_2_trimmed.fastq.gz}

SAMPLE=$(basename "$R1" _1_trimmed.fastq.gz)

echo "========================================="
echo "Processing: $SAMPLE"
echo "========================================="

# HISAT2 Alignment + BAM sorting
hisat2 \
-x reference/hisat2_index/genome \
-1 "$R1" \
-2 "$R2" \
--summary-file results/alignment/${SAMPLE}.hisat2.log \
-p 4 \
2> results/alignment/${SAMPLE}.stderr.log | \
samtools sort \
-@ 2 \
-m 1G \
-o results/alignment/${SAMPLE}.sorted.bam -

# Create BAM index
samtools index \
results/alignment/${SAMPLE}.sorted.bam

# Verify BAM integrity
samtools quickcheck \
results/alignment/${SAMPLE}.sorted.bam \
&& echo "${SAMPLE}: BAM OK"

# Generate alignment statistics
samtools flagstat \
results/alignment/${SAMPLE}.sorted.bam \
> results/alignment/qc/${SAMPLE}.flagstat.txt

echo "${SAMPLE} completed."
```

done
