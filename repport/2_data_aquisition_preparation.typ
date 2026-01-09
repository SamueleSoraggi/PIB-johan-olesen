#import "@preview/subpar:0.2.2"

= Stage 1: Data aquisition and preparation

For the first stage of the project, we will be focusing on acquiring and preparing data for analysis. This includes downloading and organizing the necessary datasets, as well as preprocessing the data to ensure it is ready for downstream analysis. The workflow is illustrated on @stage1.

For the real dataset set out in the goals, Wang et al @wangScRNAseqScATACseqReveal2025 have made their scRNA-seq and scATAC-seq data available.

The scRNA-seq data was available under NCBI Gene Expression Omnibus ID *GSE202647* from 2022, and was already ready for analysis.

The scATAC-seq data was available under NCBI BioProject ID *PRJNA1177103* from 2024. This was only the raw read data, so the Cellranger ATAC @satpathyMassivelyParallelSinglecell2019 pipeline was run for each of the five samples. For Cellranger to be able to run the data had to be structured and named in a specific way. Using the guidelines available from the offical 10X Cellranger documentation and matching the read length of each of the four files per sample was renamed accordingly.

The `count` function was run with Cellranger ATAC version 2.2.0 on each sample with reference data _refdata-cellranger-arc-GRCh38-2024-A_ using SLURM. This resulted in the `peak_matrix.h5`, `fragments.tsv` and `peak_annotations.tsv` for each sample ready for analysis.

Ideally, we wanted the data from scRNA-seq and scATAC-seq to be cell matched from their barcodes, but finding public datasets for testis with that criteria was difficult. Instead we will be matching cells by celltype instead. The data in Wang et al's study comes from the same five donors, but sequenced at seperate time points.