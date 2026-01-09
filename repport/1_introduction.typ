#import "@preview/subpar:0.2.2"

= Introduction

Spermatogenesis is a complex process that permits the differentiation of stem cells into mature spermatozoa, and is of high relevance in studying infertility conditions and cross-species differences in the biological processes.

== Goals for the project

Initial:
- learn basics of git
- learn sc workflow with scanpy, muon and scvi-tools
- work with real messy data
- Answer:
  - Cell states & trajectories: Can we recover a clean spermatogenic trajectory (spermatogonia → spermatocytes → spermatids) and supporting somatic lineages?

  - Peak→gene linkage: Which distal elements likely regulate stage-specific genes?

  - TF programs: Which TFs show coordinated motif accessibility + target expression? (e.g., STRA8, A-MYB, TAF7L)

Actually done:
- learn basics of git
- learn sc workflow with scanpy, muon and scvi-tools
- work with real messy data
- Answer: Cell states & trajectories: Can we recover a clean spermatogenic trajectory (spermatogonia → spermatocytes → spermatids) and supporting somatic lineages?
- Celltype annotation of both scRNA-seq and scATAC-seq.
- Cell topic for scATAC-seq


== Workflow

#figure(image("figs/stage1_schematic.svg"),
  caption: [Stage 1 schematic of data aquisition and preparation.])

=== Environment setup with Conda

First step was to get a working environment setup for the analyses. For this Conda was used to create a environment with the required packages, relying on `pip` for the most up-to-date packages.

For the tutorial run and scRNA-seq labelling the environmnet `torch_env.yml` @soraggiSamueleSoraggiPIBjohanolesen2025 was used. This environment includes the scverse's anndata @virshupAnndataAccessStore2024, mudata @virshupScverseProjectProvides2023, scanpy @wolfSCANPYLargescaleSinglecell2018, muon @bredikhinMUONMultimodalOmics2022 and scvi-tools @gayosoPythonLibraryProbabilistic2022 packages, as well as full PyTorch @anselPyTorch2Faster2024 CUDA capabilities for scvi-tools.

For the second scATAC-seq workflow another environment was used because of versioning requirements; `cistopic_env.yml`, consisting of the SCENIC+ @bravogonzalez-blasSCENICSinglecellMultiomic2023 suite.