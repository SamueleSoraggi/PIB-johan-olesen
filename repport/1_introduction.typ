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
- learn how to do Conda environment reproducibility
- small shell scripts to run on SLURM.
- learn single cell workflow with scanpy, muon and scvi-tools
- work with real messy data
- Answer: Cell states & trajectories: Can we recover a clean spermatogenic trajectory (spermatogonia → spermatocytes → spermatids) and supporting somatic lineages?
- Succefull celltype annotation of both scRNA-seq and scATAC-seq.
- Cell topics and DARs for scATAC-seq for further analysis

=== Data availability

All environment files, notebooks and scripts as well as the repport files for this project are available on a public github repository: #link("https://github.com/SamueleSoraggi/PIB-johan-olesen")[SamueleSoraggi/PIB-johan-olesen].


== Workflow Overview

#figure(
  image("figs/stage1_schematic.svg"),
  caption: [Stage 1 schematic of data aquisition and preparation.]
) <stage1>

#figure(
  image("figs/stage2_schematic.svg"),
  caption: [Stage 2 schematic of scRNA-seq celltype annotation with a _semi-manual_ way and CellAssign model.]
) <stage2>

#figure(
  image("figs/stage3_fail_schematic.svg"),
  caption: [Stage 3 schematic of attempt at label transfer by integrating scRNA-seq and scATAC-seq.]
) <stage3fail>

#figure(
  image("figs/pycistopic_schematic.png"),
  caption: [Stage 3 schematic of pycistopic workflow from PyCistopic documentation. @gonzalez-blasFeaturesPycisTopicDocumentation]
) <stage3>

Flowcharts drawn with `draw.io`.

=== Environment setup with Conda

First step was to get a working environment setup for the analyses. For this Conda was used to create a environment with the required packages, relying on `pip` for the most up-to-date packages.

For the tutorial run and scRNA-seq labelling the environmnet `torch_env.yml` @soraggiSamueleSoraggiPIBjohanolesen2025 was used. This environment includes the scverse's anndata @virshupAnndataAccessStore2024, mudata @virshupScverseProjectProvides2023, scanpy @wolfSCANPYLargescaleSinglecell2018, muon @bredikhinMUONMultimodalOmics2022 and scvi-tools @gayosoPythonLibraryProbabilistic2022 packages, as well as full PyTorch @anselPyTorch2Faster2024 CUDA capabilities for scvi-tools.

For the second scATAC-seq workflow another environment was used because of versioning requirements; `cistopic_env.yml`, consisting of the SCENIC+ @bravogonzalez-blasSCENICSinglecellMultiomic2023 suite.

=== Tutorial run

To start of before real testis data had been found. A quick run through of the tutorial run of multiome 10X PBMC @bredikhinProcessingGeneExpression by Bredikin to get a quick overview of how to work with single cell data and anndata objects, and to check Conda environment worked.

Was succesful in creating the same analysis as the tutorial.