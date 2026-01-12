#import "@preview/subpar:0.2.2"

= Stage 3a: Celltype annotation of scATAC-seq data with label transfer

After annotating the scRNA-seq data we can use that to annotate the scATAC-seq data. Firstly, each sample was processed similar to the scRNA-seq data of quality control, filtering, normalised and LSI transformation instead of PCA. A gene activity matrix was created from the filtered cells and features from _refdata-cellranger-arc-GRCh38-2024-A_.

The gene activity matrix is a proxy for gene expression. This works as the ATAC data is the open chromatin regions and active transcription and therefore expression of RNA happens in these open chromatin regions. It is not a perfect comparison as the open chromatin regions also contain many other elements and not only genes.

Next, the combined RNA matrix and gene activity matrix are normalised, scaled and PCA transformed, before being concatenated together. This ensures best possible label transfer between the two sets. `harmony` was used to integrate the two sets, followed by `bbknn` to remove batch effects between the RNA set and ATAC set.

Finally, doing the label transfer of celltype from scRNA-seq to scATAC-seq. The label transfer was done by finding the RNA neighbours of each ATAC cell and assigning the consensus cell. If the distance was too big from an ATAC cell to its neighbours they were not assigned during the first pass. On the second pass the already assigned ATAC cells was included as neighbours. Passes were repeated until all cells had been annotated.

Using the NOA1 sample as an example yields @NOA1_integration.

#subpar.grid(
  figure(
    image("figs/NOA1_atac_files/NOA1_atac_36_0.png"),
    caption: [NOA1 batch],
  ), <NOA1_tech>,

  figure(
    image("figs/NOA1_atac_files/NOA1_atac_41_0.png"),
    caption: [NOA1 celltype assignment],
  ), <NOA1_celltype>,
  label: <NOA1_integration>,
  columns: 2,
  caption: [UMAP plot of NOA1 integration.],
)

The complete set of all samples can be found in @integration_complete.




#figure(
  image("figs/scRNA_ATAC_integration_files/scRNA_ATAC_integration_9_0.png"),
  caption: [UMAP plot of integrated scATAC-seq on scRNA-seq],
) <integrated>

#figure(
  image("figs/scRNA_ATAC_integration_files/scRNA_ATAC_integration_15_0.png"),
  caption: [UMAP plot of integrated scATAC-seq on scRNA-seq subset on only germ cells for the integration.],
) <integrated_germ>

#figure(
  image("figs/scRNA_ATAC_integration_files/scRNA_ATAC_integration_16_0.png"),
  caption: [UMAP plot of integrated scATAC-seq on scRNA-seq subset on only somatic cells for the integration.],
) <integrated_somatic>