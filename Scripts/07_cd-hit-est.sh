#!/bin/sh
#SBATCH -A snic2023-5-461
#SBATCH -p core -n 12
#SBATCH -t 18:00:00
#SBATCH -J CD-HIT-EST
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se



cd-hit-est -i /proj/snic2022-23-541/Beetle_project/Analysis/Trinity/DeNovo/Transcriptome.fasta.transdecoder.cds
 -o CD_HIT-EST_Transcriptome.fasta.transdecoder.cds.fasta -c 1.0 -n 8 -M 0 -T 0