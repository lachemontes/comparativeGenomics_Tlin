#!/bin/sh
#SBATCH -A naiss2023-5-461
#SBATCH -p node 
#SBATCH -t 7-00:00:00
#SBATCH -J OrthoFinder
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se


module load bioinfo-tools
module load OrthoFinder/2.5.2
module load MAFFT/7.205
module load blast_databases
module load blast/2.9.0+
module load iqtree

orthofinder.py -f Fastas -M msa -T iqtree -I 1.0 -S blast