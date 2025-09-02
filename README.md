# PIB-johan-olesen
Project in bioinformatics with multiomics single cell data

## Content

- data:
    - 10X PBMC multiome from https://www.10xgenomics.com/datasets/pbmc-from-a-healthy-donor-no-cell-sorting-10-k-1-standard-2-0-0

    ```
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_cloupe.cloupe
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_analysis.tar.gz
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_web_summary.html
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_summary.csv
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_per_barcode_metrics.csv
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_filtered_feature_bc_matrix.tar.gz
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_filtered_feature_bc_matrix.h5
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_raw_feature_bc_matrix.tar.gz
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_raw_feature_bc_matrix.h5
    wget https://s3-us-west-2.amazonaws.com/10x.files/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_gex_possorted_bam.bam
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_gex_possorted_bam.bam.bai
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_gex_molecule_info.h5
    wget https://s3-us-west-2.amazonaws.com/10x.files/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_atac_possorted_bam.bam
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_atac_possorted_bam.bam.bai
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_atac_fragments.tsv.gz
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_atac_fragments.tsv.gz.tbi
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_atac_peaks.bed
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_atac_cut_sites.bigwig
    wget https://cf.10xgenomics.com/samples/cell-arc/2.0.0/pbmc_unsorted_10k/pbmc_unsorted_10k_atac_peak_annotation.tsv
    ```
    - real datasets for spermatogenesis

	- Possible sources
		- https://elifesciences.org/articles/97958 OA and NOA (azoospermia)
		- https://www.nature.com/articles/s41598-022-25729-7 case-control (Retinoic acid)
		- https://academic.oup.com/hmg/article/31/3/321/6089117?login=true (healthy spermatogenesis)
		- https://www.frontiersin.org/journals/endocrinology/articles/10.3389/fendo.2023.1138386/full NOA (azoospermia)

