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
- Annotation: GENCODE Release 49
- Aligner: HISAT2
- Quantification: featureCounts
- QC: FastQC, MultiQC, samtools

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

Quality checks performed:

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
metadata/
    sample_metadata.csv

script/
    featurecounts.sh
    multiqc_alignment.sh

results/
    alignment/
        qc/
            *.flagstat.txt
        *.hisat2.log
        *.stderr.log

    multiqc_alignment/
        multiqc_report.html
        multiqc_data/

    counts/
        gene_counts.txt.summary
```

---

## Software

- HISAT2
- samtools
- featureCounts (Subread)
- MultiQC

---

## Current Status

- ✅ Alignment complete
- ✅ BAM QC complete
- ✅ Gene quantification complete
- ✅ MultiQC alignment report complete
- ⏳ Differential expression analysis (DESeq2) in progress

---

## Next Steps

- Import count matrix into R
- Differential expression analysis using DESeq2
- PCA
- MA plot
- Volcano plot
- Heatmap
- Functional enrichment analysis
