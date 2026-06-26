# Bulk RNA-seq: Alignment, QC and FeatureCounts

This repository contains an end-to-end bulk RNA-seq analysis workflow starting from trimmed FASTQ files through read alignment, gene quantification, and (upcoming) differential expression analysis using DESeq2.

---

## Workflow

```
Trimmed FASTQ
      │
      ▼
HISAT2 Alignment
      │
      ▼
Sorted BAM (samtools)
      │
      ▼
BAM Index (.bai)
      │
      ▼
Alignment QC
(HISAT2 + samtools flagstat)
      │
      ▼
featureCounts
      │
      ▼
Gene Count Matrix
      │
      ▼
MultiQC
      │
      ▼
DESeq2 (Next Stage)
```

---

## Dataset

- Organism: Human (*Homo sapiens*)
- Genome: GRCh38
- GEO accession: GSE303802
- Organism: Homo sapiens
- Cell line: HeLa
- Platform: Illumina NovaSeq 6000
- Layout: Paired-end RNA-seq
- Total number of Samples: 12
- Annotation: GENCODE Release 49
- Aligner: HISAT2
- Quantification: featureCounts
- QC: FastQC, MultiQC, samtools

---
## Experimental Design

- CCCP at 6 hours (3 replicates)
- DMSO at 6 hours (3 replicates)
- CCCP at 12 hours (3 replicates)
- DMSO at 12 hours (3 replicates)

---

## Software

- HISAT2
- samtools
- featureCounts (Subread)
- MultiQC

---

## Project Structure

```
reference/
    genome.fa
    annotation.gtf
    hisat2_index/

results/
    alignment/
    counts/
    multiqc_alignment/

script/
    hisat2_align.sh
    featurecounts.sh
    multiqc_alignment.sh
```

---

## Alignment

Reads were aligned to the GRCh38 reference genome using HISAT2.

Output:

- Sorted BAM files
- BAM index files
- Alignment logs
- Alignment statistics

Alignment integrity was checked by:

- samtools quickcheck
- samtools flagstat
- HISAT2 alignment summary

---

## Quality Control

Alignment QC was summarized using MultiQC.

Included metrics:

- HISAT2 alignment statistics
- samtools flagstat
- featureCounts summary

  Outputs:

  ```
    results/multiqc_alignment/
    multiqc_report.html
    multiqc_data/
  ```
---

## Gene Quantification

Gene-level counts were generated using featureCounts.

Parameters:

- paired-end reads
- exon-level counting
- grouped by gene_id
- GENCODE v49 annotation

Outputs:

```
results/counts/
    gene_counts.txt
    gene_counts.txt.summary
```
