#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 12
#SBATCH -t 3-00:00:00
#SBATCH -J Single_Transdecoder
#BATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se

module load bioinfo-tools
module load TransDecoder/5.7.0


TransDecoder.LongOrfs -t /proj/snic2022-23-541/Beetle_project/Data/Trancriptomes/Tlin_assembly/Trinity_v2_CDHit_0.95.fasta
TransDecoder.Predict -t /proj/snic2022-23-541/Beetle_project/Data/Trancriptomes/Tlin_assembly/Trinity_v2_CDHit_0.95.fasta