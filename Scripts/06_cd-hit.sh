#!/bin/sh
#SBATCH -A snic2023-5-461
#SBATCH -p core -n 16
#SBATCH -t 72:00:00
#SBATCH -J CD-HIT
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se

# I did with 0.95 and 100

cd-hit -i Transcriptome.fasta.transdecoder.pep -o CD_HIT_Transcriptome.fasta.transdecoder.pep.fasta -c 1.0 -n 5 -M 0 -T 0