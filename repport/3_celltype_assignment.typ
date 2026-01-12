#import "@preview/subpar:0.2.2"

= Stage 2: Celltype annotation of scRNA-seq data

For stage 2 the main goal is to get the scRNA-seq data processed and annotated with cell types.

The workflow was done in Jupyter Notebooks in python using the `torch_env.yml` Conda environment. The analysis was mainly done using scanpy plethora of functions.

Firstly, all five dataset was loaded and concatenated into one AnnData object containing all 33683 cells and 27984 features.

Calculating quality control metrics to be able to filter followed. Using gene threshold of presens in minimum of 3 cells, cell threshold of uniquely expressed genes minimum of 300 genes and maximum of 8000, percentage of mitochondrial genes to be less than 20% and total counts of less than 75000. This yielded 28750 cells and 25464 features.

#subpar.grid(
  columns: 1,
  caption: [Quality control metrics of cells],
  figure(
    image("figs/all_cellassign_files/all_cellassign_6_0.png"),
    caption: [Before filtering],
  ), <before_filter>,

  figure(
    image("figs/all_cellassign_files/all_cellassign_8_0.png"),
    caption: [After filtering],
  ), <after_filter>,
)

== Clustering

Data was prepared for PCA and PCA was run using the arpack solver. As shown in @pca_diff the PCA transformation is able to distinguish between general cell lineages well. Now using the transformed data it was clustered using the leiden algorhitm using the top 25 principle components and 10 neighbours with a resolution of 0.5. This yielded @initial_leiden. Looking at each cluster and seeing which genes are differentially expressed compared to the other clusters, @ranked_leiden, show clusters 19 and 20 being potentially troublesome. Cluster 19 shows many ribosomal markers: _RPL10_, _RPL41_, _RPL39_, _RPS29_, _RPS15A_, _RPS27_, _RPS14_, _RPS3_, _RPL28_. This indicates potentially damaged cells so were filtered out. Cluster 20 shows very low differientation score and the genes highlighted are various tissue origins, so was also filtered out.

#subpar.grid(
  columns: 2,
  caption: [PCA associated plots],
  figure(
    image("figs/all_cellassign_files/all_cellassign_17_0.png"),
    caption: [PCA plot of _VIM_ and _DDX4_ expression in cells. _VIM_ indicates somatic lineages. _DDX4_ indicates germ cell lineages.]
  ), <pca_diff>,

  figure(
    image("figs/all_cellassign_files/all_cellassign_18_0.png"),
    caption: [PCA variance ratio ranking.]
  )
)

#subpar.grid(
  columns: 2,
  caption: [],
  figure(
    image("figs/all_cellassign_files/all_cellassign_22_0.png"),
    caption: [Initial leiden clustering of cells.],
  ), <initial_leiden>,

  figure(
    image("figs/all_cellassign_files/all_cellassign_25_0.png"),
    caption: [Top 10 ranked differentially expressed genes in each cluster compared to other clusters.],
  ), <ranked_leiden>,
)

== Celltype annotation

To find the celltype for each cluster a list of marker genes for the different expected cell types was produced in `celltype_markers.csv` and @markers. The marker genes were primarily sourced from Wang et al @wangScRNAseqScATACseqReveal2025. Of note is that many more marker genes are present for the germ cell lineages as they were the main focus. To link each cell to a celltype, they were each scored using a custom scoring function. Each cluster was then assigned the highest mean score across the cells in the cluster. It works by taking the list of marker genes associated with each cell type and comparing the expression of the marker genes with 100 random genes. A higher score therefore means higher expression of associated genes indicating how well each cell matches the celltype. `marker_score` and `clustersByScores` were taken from NGS Summer 2025 course @soraggiHdssandboxNGS_summer_course_Aarhus20242024.

The scores for all the different celltypes can be seen in @celltype_scores. As expected we find the germline cells clusters together away from the somatic cells. More interestingly, the germline clusters form a spermatid continous cluster through the different developmental stages of germ cells, with overlaps of the celltype score in the transition part of the clusters. Starting in the top left all the way to the bottom left; SSC1 spermatogonia $arrow$ SSC2 spermatogonia $arrow$ Diffing spermatogonia $arrow$ Diffed spermatogonia $arrow$ Pre-leptogene spermatocytes $arrow$ Leptogene-zygotene spermatocytes $arrow$ Pachytene spermatocytes $arrow$ Diplotene spermatocytes $arrow$ Early round spermatid $arrow$ Round spermatid $arrow$ Elongated spermatid.

The somatic cells are mostly clustered in very seperated clusters, with sertoli, macrophages, and endothelial being clearly defined. Myoid, PMC, leydig and smooth muscle blends more together having big overlaps.

@celltype_scores completes the first biological goal for the project.

#subpar.grid(
  figure(
    image("figs/all_cellassign_files/all_cellassign_33_0_1.png"),
    caption: [Celltype specific score for somatic lineages.]
  ), <somatic_score>,

  figure(
    image("figs/all_cellassign_files/all_cellassign_33_0_2.png"),
    caption: [for germline lineages. _SPG_: Spermatogonia, _SC_: Spermatocytes, _SD_: Spermatid.]
  ), <germ_score>,
  columns: 2,
  caption: [Celltype specific score.],
  label: <celltype_scores>,
)

As shown in @dotplot_markers, each germline celltype corresponds strongly to one cluster and slightly less to another one or two clusters. This is precisely what is shown on @germ_score were there is slight overlap from one stage to another.

== SCVI-tools CellAssign

#figure(
  image("figs/all_cellassign_files/all_cellassign_34_1.png"),
  caption: [Dotplot showing the expression of marker genes across the leiden clusters.],
) <dotplot_markers>

So far the analysis has been semi manual in deciding celltypes by using the simple but effective scoring function. If instead use scvi-tools to make a model to assign celltype.

First, the AnnData object is prepared by using the raw data along with a library size factor and celltype markers. A SCVI CellAssign model is then setup and trained. Using the model to predict probability of each each being a specific celltype. Each cell was then assigned the celltype with highest probability. The predicted values for each cell is visualised on @clustermap. A majority of cells have probability of ~1, with a small amount being more uncertain. Interestingly, compared to the scoring function, the predictions do not include any smooth muscle cells.

#figure(
  image("figs/all_cellassign_files/all_cellassign_48_2.png"),
  caption: [Clustermap of CellAssign model predictions. Colour indicating probability, lighter more likely.]
) <clustermap>

Comparing the two methods reveals that beside the absence of smooth muscle cells in using CellAssign, the two methods yields similar results as seen on @celltype_annotation. Instead likely having been assigned to leydig or myoid cells. Finally, as the two methods yielded similar results, the leiden cluster assigned would be the final celltypes.

#figure(
  image("figs/all_cellassign_files/all_cellassign_51_0.png"),
  caption: [Celltype annotation result using either CellAssign model or leiden clustering using the same set of marker genes. _SPG_: Spermatogonia, _SC_: Spermatocytes, _SD_: Spermatid.]
) <celltype_annotation>