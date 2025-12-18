import subprocess

sra_numbers = [
    "SRR31097965", "SRR31097966", "SRR31097967", "SRR31097968"
    ]

# this will download the .sra files to ~/ncbi/public/sra/ (will create directory if not present)
#for sra_id in sra_numbers:
#    print ("Currently downloading: " + sra_id)
#    prefetch = "apptainer run sra-tools_latest.sif prefetch " + sra_id
#    print ("The command used was: " + prefetch)
#    subprocess.call(prefetch, shell=True)

# this will extract the .sra files from above into a folder named 'fastq'
for sra_id in sra_numbers:
    print ("Generating fastq for: " + sra_id)
    fastq_dump = "apptainer run sra-tools_latest.sif fastq-dump --outdir fastq --gzip --skip-technical  --readids --read-filter pass --dumpbase --split-3 --clip " + sra_id + "/" + sra_id + ".sra"
    print ("The command used was: " + fastq_dump)
    subprocess.call(fastq_dump, shell=True)
