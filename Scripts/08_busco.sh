#!/bin/sh
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 16
#SBATCH -t 3-00:00:00
#SBATCH -J BUSCO_Insecta_odb10
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se

#Load modules
module load bioinfo-tools BUSCO/5.2.2
module load bioinfo-tools perl/5.26.2
module load bioinfo-tools perl_modules/5.26.2
module load bioinfo-tools augustus/3.4.0
source $AUGUSTUS_CONFIG_COPY


# busco -i [SEQUENCE_FILE] -l [LINEAGE] -o [OUTPUT_NAME] -m [MODE] [OTHER OPTIONS]



run_BUSCO.py -i "${QRY}" -l "${BUSCO_LINEAGE_SETS}/insecta_odb10" -o "$(basename ${QRY})_insecta_odb10_0.95" -m proteins -c 4


# To submit
sbatch --export=QRY=/proj/snic2022-23-541/Beetle_project/Analysis/CD-HIT/CD_HIT_Transcriptome.transdecoder_No_redundacy_pep.fasta 