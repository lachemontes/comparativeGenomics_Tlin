#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 16
#SBATCH -t 3-00:00:00
#SBATCH -J JellyFish
#SBATCH --mail-type=All
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se

# Directory containing the files
data_dir="/proj/snic2022-23-541/Beetle_project/Data/Genome"

# Create an array of filenames in the specified directory with the .fna extension
filenames=("${data_dir}"/*.fna)

for filepath in "${filenames[@]}"; do
  filename=$(basename -- "$filepath")
  base_name="${filename%.*}"
  jellyfish count -m 17 -s 16G -o /proj/snic2022-23-541/Beetle_project/Analysis/JellyFish/Mker_17/${base_name}_kmer_counts.jf "${filepath}"
done
