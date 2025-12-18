for file in SRR31097965 SRR31097966 SRR31097967 SRR31097968 SRR31097969; do
    sbatch fastq_to_counts.sh $file
done
