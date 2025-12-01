#!/bin/bash
#SBATCH -A snic2022-5-454
#SBATCH -p core -n 16
#SBATCH -t 72:00:00
#SBATCH -J JellyFish
#SBATCH --mail-type=All
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se

# Load necessary modules (if required)
module load jellyfish
module load genomeScope

# Set input and output directories/files
data_dir="/proj/snic2022-23-541/Beetle_project/Data/Genome/Trypodendron_lineatum.fna"
output_dir="/proj/snic2022-23-541/Beetle_project/Analysis/JellyFish"
kmer_length=your_kmer_length

# Step 1: Create k-mer counts
jellyfish count -m $kmer_length -s 100M -t your_threads \
  -C -o $output_dir/kmer_counts.jf \
  $data_dir/*.fastq.gz

# Step 2: Dump k-mer counts
jellyfish dump -c -t -L $kmer_length $output_dir/kmer_counts.jf \
  > $output_dir/kmer_counts.hist

# Step 3: Run GenomeScope
run_genomescope.R -g 2 -k $kmer_length -t your_threads \
  -p $output_dir/kmer_counts.hist \
  -o $output_dir/genomescope_output

echo "Genome size estimation completed!"