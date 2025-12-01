#!/bin/bash
#SBATCH -A snic2022-5-454
#SBATCH -p node
#SBATCH -t 7-00:00:00
#SBATCH -J RepeatMasker
#SBATCH --mail-type=All
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se



module load bioinfo-tools
module load RepeatMasker/4.1.0


RepeatMasker -pa 140 -lib /proj/snic2022-23-541/Beetle_project/Analysis/RepeatModeler/Tlineatum_db-families.fa -s trypodendron_lineatum -gff trypodendron_lineatum /proj/snic2022-23-541/Beetle_project/Data/Genome/Trypodendron_lineatum.fna