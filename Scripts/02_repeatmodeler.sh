#!/bin/bash
#SBATCH -A snic2022-5-454
#SBATCH -p node
#SBATCH -t 10-00:00:00
#SBATCH -J RepeatModeler_Tlineatum
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se


module purge
module load bioinfo-tools RepeatModeler/2.0.1

# Build RepeatModeler database from input genome file
BuildDatabase -name Tlineatum_db -engine ncbi /proj/snic2022-23-541/Beetle_project/Data/Genome/Trypodendron_lineatum.fna

# Run RepeatModeler with 32 CPU cores and 120 GB of memory
RepeatModeler -pa 32 -engine ncbi -database Tlineatum_db &> repeatmodeler.log

