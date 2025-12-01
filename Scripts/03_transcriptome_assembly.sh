
#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 16
#SBATCH -t 7-00:00:00
#SBATCH -J DeNovo_Assembly
#SBATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se
#SBATCH --array=1-11


# Load required modules
module load bioinfo-tools trinity/2.9.1
module load bioinfo-tools jellyfish/2.2.6
module load bioinfo-tools Salmon/1.9.0

# Set the temporary directory for Jellyfish
JF_TEMP_DIR=$SNIC_TMP

# Perform Jellyfish count
jellyfish count -o "$JF_TEMP_DIR/mer_counts.jf"

# Copy Jellyfish database to project storage (replace "/path/to/project/storage" with the actual path)
cp "$JF_TEMP_DIR/mer_counts.jf"  /proj/snic2022-23-541/Beetle_project/Analysis/Trinity/DeNovo

# Array of input file names
left_files=(


    "P29459_105_S108_L004_R1_001_val_1.fq.gz"
    "P29459_201_S109_L004_R1_001_val_1.fq.gz"
    "P29459_202_S110_L004_R1_001_val_1.fq.gz"
    "P29459_203_S111_L004_R1_001_val_1.fq.gz"
    "P29459_204_S112_L004_R1_001_val_1.fq.gz"
    "P29459_206_S113_L004_R1_001_val_1.fq.gz"
    "P29459_208_S114_L004_R1_001_val_1.fq.gz"
    "P29459_209_S115_L004_R1_001_val_1.fq.gz"
    "P29459_210_S116_L004_R1_001_val_1.fq.gz"
    "P29459_211_S117_L004_R1_001_val_1.fq.gz"
    "P29459_212_S118_L004_R1_001_val_1.fq.gz"



)

right_files=(

    "P29459_105_S108_L004_R2_001_val_2.fq.gz"
    "P29459_201_S109_L004_R2_001_val_2.fq.gz"
    "P29459_202_S110_L004_R2_001_val_2.fq.gz"
    "P29459_203_S111_L004_R2_001_val_2.fq.gz"
    "P29459_204_S112_L004_R2_001_val_2.fq.gz"
    "P29459_206_S113_L004_R2_001_val_2.fq.gz"
    "P29459_208_S114_L004_R2_001_val_2.fq.gz"
    "P29459_209_S115_L004_R2_001_val_2.fq.gz"
    "P29459_210_S116_L004_R2_001_val_2.fq.gz"
    "P29459_211_S117_L004_R2_001_val_2.fq.gz"
    "P29459_212_S118_L004_R2_001_val_2.fq.gz"


)

# Get the index for this job in the array
index=$((SLURM_ARRAY_TASK_ID - 1))

# Create a unique output directory for each task
output_dir="Trinity_${SLURM_ARRAY_TASK_ID}"


# Run Trinity with the corresponding input files and unique output directory
Trinity --seqType fq --left "/proj/snic2022-23-541/Beetle_project/Analysis/Trimgalore/${left_files[index]}" --right "/proj/snic2022-23-541/Beetle_project/Analysis/Trimgalore/${right_files[index]}" --output "$output_dir" --max_memory 60G 