# **Comparative genomics and orthology analysis of the striped ambrosia beetle,  *Trypodendron lineatum* : Functional, evolutionary, and ecological implications**

## Project Description

This project focuses on the comparative genomics and orthology analysis of  *Trypodendron lineatum* , a Holarctic pest with a unique xylem-boring behavior and fungal symbiosis. By assembling and annotating its genome using cutting-edge sequencing technologies, we revealed insights into its chemosensory adaptations, gene family dynamics, and evolutionary specialization. These findings contribute to understanding the functional, evolutionary, and ecological implications of its lifestyle and interactions within forest ecosystems.

## Data description and collection

For *T.lineatum*:

The Nanopore sequencing involved library preparation, adapter ligation, and sequencing on the MinION platform, generating 25 Gb of data (~190× genome coverage). Reads were assembled de novo using Flye and underwent multiple rounds of polishing with Racon, Medaka, and minimap2 to improve assembly quality. Haplotype redundancies were resolved with Purge Haplotigs and HaploMerger2.

Additionally, Illumina short-read sequencing provided 10X Chromium libraries for a male and female specimen, generating 261.27 and 134.79 million reads, respectively. These reads were used to further polish the assembly with ntHits and ntEdit, ensuring high accuracy. Post-assembly, BlobTools and BUSCO analyses confirmed the removal of contaminants and evaluated assembly completeness, achieving 99.3% completeness against insect reference genes. [View the article from Biwas et al., 2024 article on Springer](https://link.springer.com/article/10.1186/s12864-024-10678-4) ✨

### Genomic data

|          **Specie**          | **Family**               | **GenBank**         |
| :---------------------------------: | ------------------------------ | ------------------------- |
|      **Ips typographus**      | **Curculionidae**        | **GCA_016097725.1** |
|      **Aethina tumida**      | **Nitidulidae**          | **GCA_024364675.1** |
|    **Agrilus planipennis**    | **Buprestidae**          | **GCA_000699045.2** |
| **Anoplophora glabripennis** | **Cerambycidae**         | **GCA_000390285.2** |
| **Callosobruchus maculatus** | ***Chrysomelidae***    | **GCA_951848785.1** |
|  **Dendroctonus ponderosae**  | **Curculionidae**        | **GCA_020466585.2** |
|   **Diabrotica virgifera**   | **Chrysomelidae**        | **GCA_917563875.2** |
|    **Hypothenemus hampei**    | **Curculionidae**        | **GCA_013372445.1** |
| **Leptinotarsa decemlineata** | **Chrysomelidae**        | **GCA_000500325.2** |
| **Nicrophorus vespilloides** | **Silphidae**            | **GCA_001412225.1** |
|    **Onthophagus taurus**    | ***Scarabaeidae***     | **GCA_000648695.2** |
|    **Tribolium castaneum**    | **Tenebrionidae**        | **GCA_000002335.3** |
|   **Trypodendron lineatum**   | **Curculionidae**        | **TBA**             |
|    **Dendroctonus valens**    | **CurculionidaeDiptera** | **GCA_024550625.1** |

### Evidence data for genome annotation with MAKER and BRAKER

All the data was downloaded from geneBank from RefSeq except for `Dendroctonus_valens` and `Ips_typographus` .

[Data for Ips typographus available here](https://figshare.com/articles/dataset/Ips_typographus_genome_annotations_and_supporting_data/14503065)

[Data for Dendroctonus_valens available here](https://figshare.com/articles/dataset/The_genome_assembly_and_annotation_data_of_the_red_turpentine_beetle_Dendroctonus_valens/19999844)

### Evidence data for Orthology analysis

All the data was downloaded from geneBank from RefSeq for the following beetle species.

**Atum**, Aethina tumida;

**Cmac**, Callosobruchus maculatus;

**Dpon**, Dendroctonus ponderosae;

**Dvir**, Diabrotica virgifera;

**Hham**, Hypothenemus hampei; [OSF data repository](https://osf.io/vgb5e/files/osfstorage?view_only=1dc51c5f4964450d97887ba947e814ee)

**Ityp**, Ips typographus; [ Ips typographus genome annotations and supporting data ](https://figshare.com/articles/dataset/Ips_typographus_genome_annotations_and_supporting_data/14503065)

**Ldec**, Leptinotarsa decemlineata;

**Nves**, Nicrophorus vespilloides;

**Otau**, Onthophagus taurus;

**Tcas**, Tribolium castaneum;

## Analysis

### **Genome size estimation and identification of telomeres**

#### Jellyfish and Genomescope

1. **Install Jellyfish**: Make sure you have Jellyfish installed on your system. You can download via conda.
2. **Prepare your sequencing data: Ensure you have your raw sequencing data in a format supported by Jellyfish (e.g., FASTQ or FASTA).**
3. **Count k-mers: Use Jellyfish to count the occurrences of k-mers in your sequencing data. The basic command to do this is:**

```bash
# create an enviroment for Jellyfish
conda create --name Jellyfish

# Install jellyfish

conda activate Jellyfish
conda install -c conda-forge jellyfish
```

```bash
jellyfish count -m k -s <hash_size> -o <output_file> <input_file>
```

1. **K-mer size (k):**

   * **For nanopore sequencing data, longer k-mer sizes are generally preferred. This is because nanopore reads tend to be more error-prone compared to short-read sequencing technologies like Illumina. Longer k-mers can help reduce the impact of errors on the genome size estimation.**
   * **A commonly used range for k is between 17 and 31 for nanopore data. You can start with a larger k value and gradually decrease it to find the best balance between sensitivity and accuracy.**
2. **Hash size (-s):**

   * **The hash size determines the number of hash slots used by Jellyfish to store the k-mer counts. A larger hash size allows you to store more k-mers but requires more memory. Since nanopore data can be memory-intensive, it's crucial to choose an appropriate hash size.**
   * **A common choice is to use a hash size of 1 to 2 times the size of the available memory. For example, if you have 16GB of RAM, you can try using a hash size of 16GB or 32GB.**
   * **If your data is larger than the available memory, you might need to consider distributed computing options or using a smaller subset of the data for analysis Transcriptome sequencing, read mapping, and assembly.**

For [Genomescope](https://github.com/tbenavi1/genomescope2.0), I cloned the repository like this:

```bash
git clone https://github.com/tbenavi1/genomescope2.0.git
ls
cd genomescope2.0
Rscript install.R
genomescope.R -i ../reads.histo -o ../Genomescope/ -k 21
ls
cd R/
ls
cd ..

# commadn to run
./genomescope.R -i ../reads.histo -o ../Genomescope/ -k 21


```

#### Find telomers with Tidk

[Tidk](`https://github.com/tolkit/telomeric-identifier) is a toolkit to identify and visualise telomeric repeats for the Darwin Tree of Life genomes, available via conda (**you're best friend**). `tidk` works especially well on chromosomal genomes, but can also work on PacBio HiFi reads well (see [the telomeric repeat database](https://github.com/tolkit/a-telomeric-repeat-database) for many examples). There are a few modules in the tool, which may be useful to anyone investigating telomeric repeat sequences in a genome. You can also try this python script [FindTelomers.py](https://github.com/JanaSperschneider/FindTelomeres)

| **Sequence** | **Reference**                                                                                           |
| ------------------ | ------------------------------------------------------------------------------------------------------------- |
| **TTAGG**    | **FindTelomers.py**                                                                                     |
| **TTAGGG**   | **FindTelomers.py**                                                                                     |
| **CCCTAA**   | [Prušáková et al., 2021](https://www.nature.com/articles/s41598-021-92705-y#auth-Daniela-Pru__kov_-Aff1-Aff2) |
| **TTAGG**    | Prušáková et al., 2021                                                                                     |
| **TCAGG**    | Prušáková et al., 2021                                                                                     |
| **TTAGGG**   | Prušáková et al., 2021                                                                                     |

```bash
#Usage: tidk search [OPTIONS] --string <STRING> --output <OUTPUT> --dir <DIR> <FASTA>
# here an example

tidk search --string TTAGGG --output out_TTAGGG --dir 2_TTAGGG --extension tsv  Trypodendron_lineatum.fasta

tidk search --string CCCTAA --output out_CCCTAA_Ityp --dir 3_CCCTAA --extension tsv  Trypodendron_lineatum.fasta

```

### Mapping and transcriptome assembly

Before the genome annotation with [MAKER](https://github.com/Yandell-Lab/maker) and [BRAKER](https://github.com/Gaius-Augustus/BRAKER), I did a transciptome assembly withRNA-seq reads from *T. lineatum* from six females and six males. First, the reads were aligned to the reference genome using [HISAT2](https://daehwankimlab.github.io/hisat2/manual/), which provides a fast and sensitive spliced alignment suitable for insect transcriptomes. This step ensured accurate mapping across exon–intron boundaries and enabled the identification of expressed genes across different tissues. In parallel, I generated a ***de novo* transcriptome assembly** with [Trinity](https://github.com/trinityrnaseq/trinityrnaseq/wiki) to capture transcripts that may be missing, fragmented, or incompletely represented in the genome assembly. Finally, to find the coding regions within transcrpts I used [Transdecoder](https://github.com/TransDecoder/TransDecoder/wiki).

#### Genome index

```bash
#!/bin/bash
#SBATCH -A snic2022-5-454
#SBATCH -p core -n 16
#SBATCH -t 12:00:00
#SBATCH -J HISAT_Mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se
#SBATCH --output=hisat_%A_%a.out
#SBATCH --error=hisat_%A_%a.err


# Module load

module load bioinfo-tools HISAT2/2.2.1

# Genome Index

hisat2-build -p 16 /proj/snic2022-23-541/Beetle_project/Data/Genome/Trypodendron_lineatum.fna Genome_Index

```

#### Mapping

```bash
#!/bin/bash
#SBATCH -A snic2022-5-454
#SBATCH -p node
#SBATCH -t 1-00:00:00
#SBATCH -J HISAT_Tlin
#SBATCH --array=1-22
#SBATCH --mail-type=ALL
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se
#SBATCH --output=hisat_%A_%a.out
#SBATCH --error=hisat_%A_%a.err


# Module load

module load bioinfo-tools HISAT2/2.2.1

# Genome Index

#hisat2-build -p 20 /proj/snic2022-23-541/Spider_project/Data/Genome/Genome_assembly_ASM1534279v1/ncbi_dataset/data/GCA_015342795.1/GCA_015342795.1_ASM1534279v1_genomic.fna Genome_Index


# Define input and output directories
input_dir="/proj/snic2022-23-541/Beetle_project/Analysis/Trimgalore/"
output_dir="/proj/snic2022-23-541/Beetle_project/Analysis/HISAT"
genome_index="/proj/snic2022-23-541/Beetle_project/Analysis/HISAT/Genome_Index"


# Define sample name
sample=$(sed -n "${SLURM_ARRAY_TASK_ID} p" List.txt)

# Define input files
r1="${input_dir}/${sample}_R1_001_val_1.fq.gz"
r2="${input_dir}/${sample}_R2_001_val_2.fq.gz"

# Define output file
output="${output_dir}/${sample}.sam"

# Run HISAT2
hisat2 --dta -p 16 -x /proj/snic2022-23-541/Beetle_project/Analysis/HISAT/Genome_Index -1 "${r1}" -2 "${r2}" -S "${output}"

```

#### De novo assembly with Trinity

```bash
#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 16
#SBATCH -t 3-00:00:00
#SBATCH -J DeNovo_Assembly
#SBATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se
#SBATCH --array=1-2,10-11


# Load required modules
module load bioinfo-tools trinity/2.9.1
module load bioinfo-tools jellyfish/2.2.6
module load bioinfo-tools Salmon/1.9.0

# Set the temporary directory for Jellyfish
JF_TEMP_DIR=$SNIC_TMP

# Perform Jellyfish count
jellyfish count -o "$JF_TEMP_DIR/mer_counts.jf"

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
Trinity --seqType fq --left "/proj/snic2022-23-541/Beetle_project/Analysis/Trimgalore/${left_files[index]}" --right "/proj/snic2022-23-541/Beetle_project/Analysis/Trimgalore/${right_files[index]}" --output "$output_dir" --max_memory 60G --FORCE

```

#### Transdecoder

```bash
#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 12
#SBATCH -t 12:00:00
#SBATCH -J Single_Transdecoder
#BATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se


module load bioinfo-tools
module load TransDecoder/5.7.0


TransDecoder.LongOrfs -t Transcriptome_file.fasta
TransDecoder.Predict -t Transcriptome_file.fasta

```

### **Genome annotation and quality assessment** 

Before chatGPT or any other AI, I got so much help from this two guys, that have docuemted pretty well their genome annottation and have inspired me to do the same. Thanks to [Rick Masonbrink](https://bioinformaticsworkbook.org/dataAnalysis/GenomeAnnotation/Intro_To_Maker.html#gsc.tab=0) and [Daren Card](https://gist.github.com/darencard/bb1001ac1532dd4225b030cf0cd61ce2).


#### MAKER


#### BRAKER


### **Functional annotation and orthologs gene detection**

### **Gene family evolution (expansions and contractions)**

### **Reconstruction of phylogenetic trees**

## Results
