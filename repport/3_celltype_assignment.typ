#import "@preview/subpar:0.2.2"

= Stage 2: Celltype annotation of scRNA-seq data

For stage 2 the main goal is to get the scRNA-seq data processed and annotated with cell types.

Start with 33683 cells and 27984 features.
After filtering 28750 cells and 25464 features.

#subpar.grid(
  columns: 1,
  caption: [],
  figure(
    image("figs/all_cellassign_files/all_cellassign_22_0.png"),
    caption: [Initial leiden clustering of cells.],
    label: <initial_leiden>,
  ),

  figure(
    image("figs/all_cellassign_files/all_cellassign_25_0.png"),
    caption: [Top 10 ranked differentially expressed genes in each cluster compared to other clusters.],
    label: <ranked_leiden>,
  ),
)

As seen on @ranked_leiden cluster 19, 20 will be filtered out due to

#figure(
  image("figs/all_cellassign_files/all_cellassign_34_1.png"),
  caption: [Dotplot showing the expression of marker genes across the leiden clusters.],
) <dotplot_markers>

#figure(
  image("figs/all_cellassign_files/all_cellassign_33_0.png"),
  caption: [Celltype specific score. _SPG_: Spermatogonia, _SC_: Spermatocytes, _SD_: Spermatid.]
) <celltype_score>

To score each cell to find how well the expression profile matches the marker genes for each celltype @marker_score_function is used. The way it works is simply by comparing if the marker genes associated with a celltype are more highly expressed than 100 random genes.

```python
def marker_score(markers_dict, adata, N_samples=100, random_seed=42): # from NGS 2025 course pythonScript.py
    np.random.seed(random_seed)
    markers_list = []
    N_genes = adata.shape[1]
    random_genes = np.unique( np.random.randint(low=0, high=N_genes, size=N_samples) )
    gene_names = adata.var_names[random_genes]
    for i in markers_dict:
        markers_list.append(f'{i}_score')
        adata.obs[f'{i}_score'] = np.array(np.mean(adata[:,markers_dict[i]].X,1) - np.mean(adata[:,gene_names].X,(0,1)))
    return markers_list, adata
``` <marker_score_function>

To assign a celltype to each cluster is done using @cluster_score_function. It works by changing the names of the clusters to the highest mean marker score of cells in a cluster.

```python
def clustersByScores(adata, markers_scores, leidenClusters): # from NGS 2025 pythonScripts
    clusters = pd.Categorical(leidenClusters)
    scoresTable = adata.obs[markers_scores]
    clusterUnique = np.unique(leidenClusters)
    newNames = pd.Series(index=leidenClusters)
    for CLST in clusterUnique:
        meanScores = np.mean( scoresTable.loc[leidenClusters==CLST,:], 0)
        newId = meanScores.index[ np.argmax(meanScores) ].split('_')[0]
        newNames[CLST] = newId
    return(pd.Categorical(newNames))
``` <cluster_score_function>

#figure(
  image("figs/all_cellassign_files/all_cellassign_51_0.png"),
  caption: [Celltype annotation result using either CellAssign model or leiden clustering using the same set of marker genes. _SPG_: Spermatogonia, _SC_: Spermatocytes, _SD_: Spermatid.]
) <celltype_annotation>