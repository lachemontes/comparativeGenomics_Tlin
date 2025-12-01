#!/bin/sh
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 12
#SBATCH -t 7-00:00:00
#SBATCH -J CAFE
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se


module load bioinfo-tools
module load module load gcc/9.2.0



../bin/cafe5 -i filtered.cafe.input.tsv -t SpeciesTree_rooted_ultra.txt