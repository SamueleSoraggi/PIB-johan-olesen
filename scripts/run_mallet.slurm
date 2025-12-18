#!/bin/bash
#SBATCH --job-name=mallet_model
#SBATCH --output=mallet_model_%A_%a.out
#SBATCH --error=mallet_model_%A_%a.err
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=128G
#SBATCH --array=0-10
#SBATCH --account=projectsInBioinformatics

# Load conda
source $(conda info --base)/etc/profile.d/conda.sh
conda activate cistopic

# Topic list
TOPICS=(2 5 10 15 20 25 30 35 40 45 50)

# Select topic based on array index
N_TOPICS=${TOPICS[$SLURM_ARRAY_TASK_ID]}

# Run Python script inside conda environment
python run_mallet_model.py $N_TOPICS

