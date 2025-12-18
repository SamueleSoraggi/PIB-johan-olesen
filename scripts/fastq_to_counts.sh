#!/bin/bash
#SBATCH --account projectsInBioinformatics
#SBATCH -c 16
#SBATCH --mem 64g

cellranger-atac count --id=$1 \
                      --reference="/faststorage/project/projectsInBioinformatics/data/refdata-cellranger-arc-GRCh38-2024-A" \
                      --fastqs="/faststorage/project/projectsInBioinformatics/data/PRJNA1177103_aws/${1}_split" \
                      --sample=$1 \
                      --localmem=63 \
                      --localcores=16
