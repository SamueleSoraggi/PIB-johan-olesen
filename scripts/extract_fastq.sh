#!/bin/bash
#SBATCH --account projectsInBioinformatics
#SBATCH -c 2
#SBATCH --mem 16g

apptainer run /faststorage/project/projectsInBioinformatics/workspaces/johan/sra-tools_latest.sif fastq-dump --outdir /faststorage/project/projectsInBioinformatics/workspaces/johan/fastq --gzip --include-technical --readids --read-filter pass --dumpbase --split-3 --clip $1

