!/bin/sh
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 16
#SBATCH -t 3-00:00:00
#SBATCH -J STAR_Mapping
#SBATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se

# Module load
module load bioinfo-tools star/2.7.9a

#Genome Index

STAR --runThreadN 60 --runMode genomeGenerate --genomeDir /proj/snic2022-23-541/Beetle_project/Analysis/STAR/Genome_Index --genomeFastaFiles /proj/snic2022-23-541/Beetle_project/Data/Genome/Trypodendron_lineatum.fna --limitGenomeGenerateRAM 142967046410 --genomeSAindexNbases 13

# Run the STAR command with the modified options
STAR --runThreadN 20 --genomeDir /proj/snic2022-23-541/Beetle_project/Analysis/STAR/Genome_Index --readFilesIn /proj/snic2022-23-541/Beetle_project/Analysis/Trimgalore/P29459_105_S108_L004_R1_001_val_1.fq.gz,P29459_105_S108_L004_R2_001_val_2.fq.gz,P29459_201_S109_L004_R1_001_val_1.fq.gz,P29459_201_S109_L004_R2_001_val_2.fq.gz,P29459_202_S110_L004_R1_001_val_1.fq.gz,P29459_202_S110_L004_R2_001_val_2.fq.gz,P29459_203_S111_L004_R1_001_val_1.fq.gz,P29459_203_S111_L004_R2_001_val_2.fq.gz,P29459_204_S112_L004_R1_001_val_1.fq.gz,P29459_204_S112_L004_R2_001_val_2.fq.gz,P29459_206_S113_L004_R1_001_val_1.fq.gz,P29459_206_S113_L004_R2_001_val_2.fq.gz,P29459_208_S114_L004_R1_001_val_1.fq.gz,P29459_208_S114_L004_R2_001_val_2.fq.gz,P29459_209_S115_L004_R1_001_val_1.fq.gz,P29459_209_S115_L004_R2_001_val_2.fq.gz,P29459_210_S116_L004_R1_001_val_1.fq.gz,P29459_210_S116_L004_R2_001_val_2.fq.gz,P29459_211_S117_L004_R1_001_val_1.fq.gz,P29459_211_S117_L004_R2_001_val_2.fq.gz,P29459_212_S118_L004_R1_001_val_1.fq.gz,P29459_212_S118_L004_R2_001_val_2.fq.gz --limitBAMsortRAM 25965203113 --readFilesCommand gunzip -c  --outSAMattrRGline ID:P29459_105_S108_L004_R1 , ID:P29459_105_S108_L004_R2 , ID:P29459_201_S109_L004_R1 , ID:P29459_201_S109_L004_R2 , ID:P29459_202_S110_L004_R1 , ID:P29459_202_S110_L004_R2 , ID:P29459_203_S111_L004_R1 , ID:P29459_203_S111_L004_R2 , ID:P29459_204_S112_L004_R1 , ID:P29459_204_S112_L004_R2 , ID:P29459_206_S113_L004_R1 , ID:P29459_206_S113_L004_R2 , ID:P29459_208_S114_L004_R1 , ID:P29459_208_S114_L004_R2 , ID:P29459_209_S115_L004_R1 , ID:P29459_209_S115_L004_R2 , ID:P29459_210_S116_L004_R1 , ID:P29459_210_S116_L004_R2 , ID:P29459_211_S117_L004_R1 , ID:P29459_211_S117_L004_R2 , ID:P29459_212_S118_L004_R1 , ID:P29459_212_S118_L004_R2 --outSAMtype BAM SortedByCoordinate 