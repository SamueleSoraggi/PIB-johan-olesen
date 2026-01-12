#import "@preview/subpar:0.2.2"

= Stage 3b: Celltype annotation of scATAC-seq data with pycistopic


== Preparing for cistopic objects

== Cistopic objects




=== Model selection

#figure(
  image("figs/pycictopic_on_integrated_files/pycictopic_on_integrated_47_0.png"),
  caption: [LDA model selection],
) <cistopic_model_selection>

#figure(
  image("figs/pycictopic_on_integrated_files/pycictopic_on_integrated_70_0.png"),
  caption: [Statistics of scATAC-seq],
) <cistopic_stats>

=== Clustering

#figure(
  image("figs/pycictopic_on_integrated_files/pycictopic_on_integrated_61_0.png"),
  caption: [Clustering of scATAC-seq],
) <cistopic_clustering>

=== Topics

#figure(
  image("figs/pycictopic_on_integrated_files/pycictopic_on_integrated_72_0.png"),
  caption: [Topic enrichment for all 30 topics.],
) <cistopic_enrichment_UMAP>

#figure(
  image("figs/pycictopic_on_integrated_files/pycictopic_on_integrated_119_0.png"),
  caption: [Enrichment of certain marker genes. _CD52_; B, _VWF_; endothelial, _CFD_; leydig, _CD14_; macrophage, _CCL2_; mast, _CXCR4_; plasma, _DPEP1_; PMC, _S100B_; schwann, _APOA1_; sertoli, _TAGLN_; smooth muscle, _CCL5_; T, _PIWIL4_; SSC0, _ID4_; SSC1.SPG, _DMRT1_; Diffing.SPG, _SSX3_; Diffed.SPG, _DPH7_ PreLeptotene.SC, _PIWIL1_; Pachytene.SC, _ART5_; Diplotene.SC, _FAM24A_; Early.Round.SD, _PRM2_; Elongated.SD],
) <cistopic_marker_enrichment>

=== Label transfer
harmony seems best.

#figure(
  image("figs/pycictopic_on_integrated_files/pycictopic_on_integrated_144_0.png"),
  caption: [Celltype annotation using different integration methods using scRNA-seq to annotate.],
) <cistopic_cellannotation>

#figure(
  image("figs/pycictopic_on_integrated_files/pycictopic_on_integrated_147_0.png"),
  caption: [Topic enrichment heatmap for harmony annotated cell types.],
) <cistopic_enrichment_cellannotation>
