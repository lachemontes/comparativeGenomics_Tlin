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

Before **chatGPT** or any other AI tools existed, I got so much help from this two guys, Thanks to [Rick Masonbrink](https://bioinformaticsworkbook.org/dataAnalysis/GenomeAnnotation/Intro_To_Maker.html#gsc.tab=0) and [Daren Card](https://gist.github.com/darencard/bb1001ac1532dd4225b030cf0cd61ce2). They documented their genome annotation pipelines so well that they inspired me to create and share my own.  I also find it quite funny that the first author of **MAKER** has the same last name as the reggaeton singer **Yandel. Find here some playlist that helped me too** [Yandel spotify](https://open.spotify.com/artist/0eHQ9o50hj6ZDNBt6Ys1sD) and [YANDEL youtube](https://www.youtube.com/channel/UC-LRORSJOy5cOBd5TVVQ6Fw)

#### RepeatMasker

```bash
#!/bin/sh
#SBATCH -A snic2022-5-454
#SBATCH -p node
#SBATCH -t 7-00:00:00
#SBATCH -J RepeatMasker
#SBATCH --mail-type=All
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se



module load bioinfo-tools
module load RepeatMasker/4.1.0

#RepeatMasker -species Drosophila -lib /proj/snic2022-23-541/Beetle_project/Analysis/RepeatModeler/Tlineatum_db-families.fa /proj/snic2022-23-541/Beetle_project/Data/Genome/Trypodendron_lineatum.fna

RepeatMasker -lib /proj/snic2022-23-541/Beetle_project/Analysis/RepeatModeler/Tlineatum_db-families.fa /proj/snic2022-23-541/Beetle_project/Data/Genome/Trypodendron_lineatum.fna


```

#### RepeatModeler

```bash
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


```

#### Maker round 1

This initial round of MAKER was designed to generate **high-confidence, evidence-supported gene models** that will be used to train *ab-initio* gene predictors (like SNAP and Augustus) in subsequent annotation rounds. The process relied exclusively on **homology evidence** (ESTs and proteins) and  **repeat masking** , with *ab-initio* prediction disabled.

Prior to annotation, the genome was masked to identify and soft-mask repetitive elements. This is a critical step to prevent transposable elements and other low-complexity regions from being incorrectly annotated as protein-coding genes.

```bash
#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p node
#SBATCH -t x-00:00:00
#SBATCH -J MAKER_R1
#SBATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se


# Load necessary modules
module load bioinfo-tools
module load maker/3.01.2-beta-mpi
module load augustus/3.2.3
module load perl_modules/5.18.4
module load RepeatMasker/4.0.7_Perl5.24.1
module load perl/5.24.1
module load perl_modules/5.24.1
module load module load blast/2.10.1

# Set up Augustus configuration
source $AUGUSTUS_CONFIG_COPY

# Export MPI configuration
export LD_PRELOAD=$MPI_ROOT/lib/libmpi.so
export OMPI_MCA_mpi_warn_on_fork=0

# Print start time
echo "Running maker"
date

# Run MAKER with MPI
mpiexec maker -cpus 1 -TMP $SNIC_TMP -fix_nucleotides maker_opts.ctl maker_bopts.ctl maker_exe.ctl

# Print end time
echo "Finished running maker"
date
```

```bash

#-----Genome (these are always required)
genome=/proj/snic2022-23-541/Beetle_project/Data/Genome/Contig_251_Tlin.fasta #genome sequence (fasta file or fasta embeded in
GFF3 file)
organism_type=eukaryotic #eukaryotic or prokaryotic. Default is eukaryotic

#-----Re-annotation Using MAKER Derived GFF3
maker_gff= #MAKER derived GFF3 file
est_pass=0 #use ESTs in maker_gff: 1 = yes, 0 = no
altest_pass=0 #use alternate organism ESTs in maker_gff: 1 = yes, 0 = no
protein_pass=0 #use protein alignments in maker_gff: 1 = yes, 0 = no
rm_pass=0 #use repeats in maker_gff: 1 = yes, 0 = no
model_pass=0 #use gene models in maker_gff: 1 = yes, 0 = no
pred_pass=0 #use ab-initio predictions in maker_gff: 1 = yes, 0 = no
other_pass=0 #passthrough anyything else in maker_gff: 1 = yes, 0 = no

#-----EST Evidence (for best results provide a file for at least one)
est=/proj/snic2022-23-541/Beetle_project/Analysis/CD-HIT/CD_HIT-EST_Transcriptome.fasta.transdecoder.cds.fasta,/proj/snic2022-2
3-541/Beetle_project/Data/Trancriptomes/Tlin_assembly/Trinity_v2_CDHit_0.95.fasta #set of ESTs or assembled mRNA-seq in fasta f
ormat
altest= #EST/cDNA sequence file in fasta format from an alternate organism
est_gff= #aligned ESTs or mRNA-seq from an external GFF3 file
altest_gff= #aligned ESTs from a closly relate species in GFF3 format

#-----Protein Homology Evidence (for best results provide a file for at least one)
protein=/proj/snic2022-23-541/Beetle_project/Data/Evidence_Data/Coleoptera_Evidence_Refseq.fasta,/proj/snic2022-23-541/Beetle_p
roject/Data/Evidence_Data/refseq_db.fasta  #protein sequence file in fasta format (i.e. from mutiple organisms)
protein_gff=  #aligned protein homology evidence from an external GFF3 file

#-----Repeat Masking (leave values blank to skip repeat masking)
model_org= #select a model organism for RepBase masking in RepeatMasker
rmlib=/proj/snic2022-23-541/Beetle_project/Analysis/RepeatModeler/RM_11528.MonApr31245172023/consensi.fa.classified #provide an
 organism specific repeat library in fasta format for RepeatMasker
repeat_protein=/sw/bioinfo/maker/3.01.2-beta-mpi/rackham/data/te_proteins.fasta #provide a fasta file of transposable element p
roteins for RepeatRunner
rm_gff=/proj/snic2022-23-541/Beetle_project/Analysis/RepeatMasker/Trypodendron_lineatum.fna.preSunJul231907462023.RMoutput/Tryp
odendron_lineatum.fna.out #pre-identified repeat elements from an external GFF3 file
prok_rm=0 #forces MAKER to repeatmask prokaryotes (no reason to change this), 1 = yes, 0 = no
softmask=1 #use soft-masking rather than hard-masking in BLAST (i.e. seg and dust filtering)

#-----Gene Prediction
snaphmm= #SNAP HMM file
gmhmm= #GeneMark HMM file
augustus_species= #Augustus gene prediction species model
fgenesh_par_file= #FGENESH parameter file
pred_gff= #ab-initio predictions from an external GFF3 file
model_gff= #annotated gene models from an external GFF3 file (annotation pass-through)
run_evm=0 #run EvidenceModeler, 1 = yes, 0 = no
est2genome=1 #infer gene predictions directly from ESTs, 1 = yes, 0 = no
protein2genome=1 #infer predictions from protein homology, 1 = yes, 0 = no
trna=0 #find tRNAs with tRNAscan, 1 = yes, 0 = no
snoscan_rrna= #rRNA file to have Snoscan find snoRNAs
snoscan_meth= #-O-methylation site fileto have Snoscan find snoRNAs
unmask=0 #also run ab-initio prediction programs on unmasked sequence, 1 = yes, 0 = no
allow_overlap= #allowed gene overlap fraction (value from 0 to 1, blank for default)

#-----Other Annotation Feature Types (features MAKER doesn't recognize)
other_gff= #extra features to pass-through to final MAKER generated GFF3 file

#-----External Application Behavior Options
alt_peptide=C #amino acid used to replace non-standard amino acids in BLAST databases
cpus=1 #max number of cpus to use in BLAST and RepeatMasker (not for MPI, leave 1 when using MPI)

#-----MAKER Behavior Options
max_dna_len=100000 #length for dividing up contigs into chunks (increases/decreases memory usage)
min_contig=1 #skip genome contigs below this length (under 10kb are often useless)

pred_flank=200 #flank for extending evidence clusters sent to gene predictors
pred_stats=0 #report AED and QI statistics for all predictions as well as models
AED_threshold=1 #Maximum Annotation Edit Distance allowed (bound by 0 and 1)
min_protein=0 #require at least this many amino acids in predicted proteins
alt_splice=0 #Take extra steps to try and find alternative splicing, 1 = yes, 0 = no
always_complete=0 #extra steps to force start and stop codons, 1 = yes, 0 = no
map_forward=0 #map names and attributes forward from old GFF3 genes, 1 = yes, 0 = no
keep_preds=0 #Concordance threshold to add unsupported gene prediction (bound by 0 and 1)

split_hit=10000 #length for the splitting of hits (expected max intron size for evidence alignments)
min_intron=20 #minimum intron length (used for alignment polishing)
single_exon=0 #consider single exon EST evidence when generating annotations, 1 = yes, 0 = no
single_length=250 #min length required for single exon ESTs if 'single_exon is enabled'
correct_est_fusion=0 #limits use of ESTs in annotation to avoid fusion genes

tries=2 #number of times to try a contig if there is a failure for some reason
clean_try=0 #remove all data from previous run before retrying, 1 = yes, 0 = no
clean_up=0 #removes theVoid directory with individual analysis files, 1 = yes, 0 = no
TMP= #specify a directory other than the system default temporary directory for temporary files
```

#### **Get some idea of how long it takes round 1 ...**

```bash

finishedjobinfo -j 44493339
2024-01-28 03:03:16 jobid=44493339 jobstate=COMPLETED username=zaidemo account=naiss2023-5-461 nodes=r166 procs=20 partition=node qos=normal jobname=MAKER_R1 maxmemory_in_GiB=5.0 maxmemory_node=r166 timelimit=14-00:00:00 submit_time=2024-01-19T11:18:17 start_time=2024-01-19T11:22:04 end_time=2024-01-28T03:03:16 runtime=8-15:41:12 margin=5-08:18:48 queuetime=00:03:47
```

Since MAKER relies on **BLAST** to align all transcript and protein evidence against the genome, this initial alignment step is computationally intensive. With 12 processing cores, we estimate the run time to be at least several days. The total execution speed is dependent on the allocation of resources (more cores yield faster completion) and the **quality of the genome assembly** (more fragmented or smaller scaffolds lead to longer processing times). The round concludes with the assembly of the final Gene Feature Format (GFF) and FASTA output files.

```bash
cd Trypodendron_lineatum.maker.output/

gff3_merge -s -d Trypodendron_lineatum_master_datastore_index.log > Trypodendron_lineatum.gff

# create proteins and transcripts fasta file
# you'll need to load maker environment . . .  probably
fasta_merge -d Trypodendron_lineatum_master_datastore_index.log

# GFF w/o the sequences
gff3_merge -n -s -d Trypodendron_lineatum_master_datastore_index.log > Trypodendron_lineatum.all.maker.noseq.gff
```

#### Training *Ab-Initio* Gene Predictors

The primary goal of the second phase is to leverage the high-confidence gene models generated in Round 1 (based on transcript and protein evidence) to **train** two key *ab-initio* gene prediction tools: **SNAP** (Simplified Non-redundant Annotation Program) and  **AUGUSTUS** .

*Ab-initio* prediction is crucial because it can identify novel genes or gene structures that lack significant homology to known transcripts or proteins.

**1. Training the SNAP Predictor**

SNAP is a Hidden Markov Model (HMM)-based gene finder that is highly effective when trained on an organism-specific dataset.

* **Extraction:** The first step is to filter and reformat the GFF output from MAKER Round 1 to create a clean, non-redundant set of gene models. This is done using MAKER's accompanying utility scripts (e.g., `gff3_merge`, `fathom`, and `forge`).
* **Training:** These filtered models are fed into the SNAP training module, which learns the specific statistical properties (codon usage, splice sites, exon/intron lengths) of the genes within the *Trypodendron lineatum* genome.
* **Output:** The result is a **SNAP HMM file** (`snaphmm`), which is a trained model file ready to be used in MAKER Round 3.

```bash
#load the bioinformatics module and maker

mkdir snap
mkdir snap/
cd snap/round1

# export 'confident' gene models from MAKER and rename to something meaningful
maker2zff -x 0.25 -l 50 -d ../MAKER_R1/Trypodendron_lineatum.maker.output/Trypodendron_lineatum_master_datastore_index.log
rename 's/genome/Trypodendron_lineatum_makerR1/g' 

# gather some stats and validate

fathom genome.ann genome.dna -gene-stats > gene-stats.log 2>&1
fathom genome.ann genome.dna -validate > validate.log 2>&1

# collect the training sequences and annotations, plus 1000 surrounding bp for training
fathom genome.ann genome.dna -categorize 1000 > categorize.log 2>&1
fathom uni.ann uni.dna -export 1000 -plus > uni-plus.log 2>&1


# create the training parameters
mkdir params
cd params
forge ../export.ann ../export.dna > ../forge.log 2>&1
cd ..
# assembly the HMM
hmm-assembler.pl genome . > genome.hmm
```

**2. Training the AUGUSTUS Predictor**

AUGUSTUS is another powerful *ab-initio* gene finder that also uses HMMs. Unlike SNAP, AUGUSTUS requires a separate training process that often involves using a small, confirmed set of high-quality gene models.

* **Extraction & Filtering:** A similar process is used to extract a subset of the best gene models from MAKER Round 1's GFF.
* **Training:** These models are used to train AUGUSTUS, creating a new, species-specific parameter set. This step often uses scripts like **`autoAug`** (or similar tools) to automate the training process.
* **Output:** The result is a new, species-specific **AUGUSTUS parameter set** saved under a new species name (e.g., `augustus_species=Trypodendron_lineatum`). This parameter set will be used in MAKER Round 3.

**First, we must put together training sequences using the gene models we created in our first run of MAKER. We do this by issuing the following command to excise the regions that contain mRNA annotations based on our initial MAKER run (with 1000bp on each side).**

```bash

awk -v OFS="\t" '{ if ($3 == "mRNA") print $1, $4, $5 }' /proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output/Trypodendron_lineatum.all.maker.noseq.gff | \
awk -v OFS="\t" '{ if ($2 < 1000) print $1, "0", $3+1000; else print $1, $2-1000, $3+1000 }' | \
bedtools getfasta -fi /proj/snic2022-23-541/Beetle_project/Data/Genome/Genomes_Results/Trypodendron_lineatum.fna -bed - -fo /proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output/Trypodendron_lineatum.all.maker.transcripts1000.fasta
```

```bash
awk -v OFS="\t" '{ if ($3 == "mRNA") print $1, $4, $5 }' Trypodendron_lineatum.all.maker.noseq.gff | awk -v OFS="\t" '{ if ($2 < 1000) print $1, "0", $3+1000; else print $1, $2-1000, $3+1000 }' |  bedtools getfasta -fi Trypodendron_lineatum.fna -bed - -fo Coordinates_command.fast
```

#### BUSCO with Augustus

```bash
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
xsource $AUGUSTUS_CONFIG_COPY


# busco -i [SEQUENCE_FILE] -l [LINEAGE] -o [OUTPUT_NAME] -m [MODE] [OTHER OPTIONS]



run_BUSCO.py -i "${QRY}" -l "${BUSCO_LINEAGE_SETS}/insecta_odb10" -o "$(basename ${QRY})_insecta_odb10_0.95" -m genome -c 12 --long --augustus_parameters='--progress=true'


# To submit
sbatch --export=QRY=Trypodendron_lineatum.all.maker.transcripts1000.fasta BUSCO_AUGUSTUS.sh 
```

**Once BUSCO is complete, it will give you an idea of how complete your annotation is (though be cautious, because we haven't filtered away known alternative transcripts that will be binned as duplicates). We need to do some post-processing of the HMM models to get them ready for MAKER. First, we'll rename the files within **`/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/BUSCO_Augustus/BUSCO_4.1/run_insecta_odb10/augustus_output/retraining_parameters/BUSCO_BUSCO_4.1`.

```bash
#!/bin/bash

# Define the new basename
new_basename="Trypodendron_lineatum_"


# Iterate through the files and rename them
for filename in BUSCO_BUSCO_4.1_*; do
    if [ -e "$filename" ]; then
        new_filename="${filename/BUSCO_BUSCO_4.1_/$new_basename}"
        mv "$filename" "$new_filename"
        echo "Renamed: $filename to $new_filename"
    fi
done
```

**Then, we must copy these into the** **`$AUGUSTUS_CONFIG_PATH` species HMM location so they are accessible by Augustus and MAKER.**

```bash
/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/BUSCO_Augustus/augustus_config/species

mkdir Trypodendron_lineatum

cp /proj/snic2022-23-541/Beetle_project/Analysis/MAKER/BUSCO_Augustus/BUSCO_4.1/run_insecta_odb10/augustus_output/retraining_parameters/BUSCO_BUSCO_4.1/Trypodendron_lineatum_* .
```

#### MAKER With *Ab Initio* Gene Predictors

Now let's run a second round of MAKER, but this time we will have SNAP and Augustus run within MAKER to help create more sound gene models. MAKER will use the annotations from these two prediction programs when constructing its models. Before running, let's first recycle the mapping of empicial evidence we have from the first MAKER round, so we don't have to perform all the BLASTs, etc. again.

```bash
# transcript alignments
awk '{ if ($2 == "est2genome") print $0 }' Trypodendron_lineatum.all.maker.noseq.gff > Trypodendron_lineatum.all.maker.noseq.est2genome.gff

/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output/Trypodendron_lineatum.all.maker.noseq.est2genome.gff

# protein alignments
awk '{ if ($2 == "protein2genome") print $0 }' Trypodendron_lineatum.all.maker.noseq.gff > Trypodendron_lineatum.all.maker.noseq.protein2genome.gff

/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output/Trypodendron_lineatum.all.maker.noseq.protein2genome.gff

# repeat alignments
awk '{ if ($2 ~ "repeat") print $0 }' Trypodendron_lineatum.all.maker.noseq.gff > Trypodendron_lineatum.all.maker.noseq.repeats.gff


/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output/Trypodendron_lineatum.all.maker.noseq.repeats.gff
```

#### MKAER R2

**This second round worked without snap hmm**

```bash
#-----Genome (these are always required)
genome=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.fasta #genome sequence (fasta file or fasta embeded in GFF3 file)
organism_type=eukaryotic #eukaryotic or prokaryotic. Default is eukaryotic

#-----Re-annotation Using MAKER Derived GFF3
maker_gff= #MAKER derived GFF3 file
est_pass=0 #use ESTs in maker_gff: 1 = yes, 0 = no
altest_pass=0 #use alternate organism ESTs in maker_gff: 1 = yes, 0 = no
protein_pass=0 #use protein alignments in maker_gff: 1 = yes, 0 = no
rm_pass=0 #use repeats in maker_gff: 1 = yes, 0 = no
model_pass=0 #use gene models in maker_gff: 1 = yes, 0 = no
pred_pass=0 #use ab-initio predictions in maker_gff: 1 = yes, 0 = no
other_pass=0 #passthrough anyything else in maker_gff: 1 = yes, 0 = no

#-----EST Evidence (for best results provide a file for at least one)
est= #set of ESTs or assembled mRNA-seq in fasta format
altest= #EST/cDNA sequence file in fasta format from an alternate organism
est_gff=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output_1/Trypodendron_lineatum.all.maker.noseq.est2genome.gff #aligned ESTs or mRNA-seq from an external GFF3 file
altest_gff= #aligned ESTs from a closly relate species in GFF3 format

#-----Protein Homology Evidence (for best results provide a file for at least one)
protein=  #protein sequence file in fasta format (i.e. from mutiple organisms)
protein_gff=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output_1/Trypodendron_lineatum.all.maker.noseq.protein2genome.gff  #aligned protein homology evidence from an external GFF3 file

#-----Repeat Masking (leave values blank to skip repeat masking)
model_org= #select a model organism for RepBase masking in RepeatMasker
rmlib= #provide an organism specific repeat library in fasta format for RepeatMasker
repeat_protein= #provide a fasta file of transposable element proteins for RepeatRunner
rm_gff=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output_1/Trypodendron_lineatum.all.maker.noseq.repeats.gff #pre-identified repeat elements from an external GFF3 file
prok_rm=0 #forces MAKER to repeatmask prokaryotes (no reason to change this), 1 = yes, 0 = no
softmask=1 #use soft-masking rather than hard-masking in BLAST (i.e. seg and dust filtering)

#-----Gene Prediction
snaphmm= #SNAP HMM file
gmhmm= #GeneMark HMM file
augustus_species=Trypodendron_lineatum #Augustus gene prediction species model
fgenesh_par_file= #FGENESH parameter file
pred_gff= #ab-initio predictions from an external GFF3 file
model_gff= #annotated gene models from an external GFF3 file (annotation pass-through)
run_evm=0 #run EvidenceModeler, 1 = yes, 0 = no
est2genome=1 #infer gene predictions directly from ESTs, 1 = yes, 0 = no
protein2genome=1 #infer predictions from protein homology, 1 = yes, 0 = no
trna=1 #find tRNAs with tRNAscan, 1 = yes, 0 = no
snoscan_rrna= #rRNA file to have Snoscan find snoRNAs
snoscan_meth= #-O-methylation site fileto have Snoscan find snoRNAs
unmask=0 #also run ab-initio prediction programs on unmasked sequence, 1 = yes, 0 = no
allow_overlap=0 #allowed gene overlap fraction (value from 0 to 1, blank for default)

#-----Other Annotation Feature Types (features MAKER doesn't recognize)
other_gff= #extra features to pass-through to final MAKER generated GFF3 file

#-----External Application Behavior Options
alt_peptide=C #amino acid used to replace non-standard amino acids in BLAST databases
cpus=16 #max number of cpus to use in BLAST and RepeatMasker (not for MPI, leave 1 when using MPI)

#-----MAKER Behavior Options
max_dna_len=100000 #length for dividing up contigs into chunks (increases/decreases memory usage)
min_contig=1 #skip genome contigs below this length (under 10kb are often useless)

pred_flank=200 #flank for extending evidence clusters sent to gene predictors
pred_stats=0 #report AED and QI statistics for all predictions as well as models
AED_threshold=1 #Maximum Annotation Edit Distance allowed (bound by 0 and 1)
min_protein=0 #require at least this many amino acids in predicted proteins
alt_splice=0 #Take extra steps to try and find alternative splicing, 1 = yes, 0 = no
always_complete=0 #extra steps to force start and stop codons, 1 = yes, 0 = no
map_forward=0 #map names and attributes forward from old GFF3 genes, 1 = yes, 0 = no
keep_preds=0 #Concordance threshold to add unsupported gene prediction (bound by 0 and 1)

split_hit=10000 #length for the splitting of hits (expected max intron size for evidence alignments)
min_intron=20 #minimum intron length (used for alignment polishing)
single_exon=0 #consider single exon EST evidence when generating annotations, 1 = yes, 0 = no
single_length=250 #min length required for single exon ESTs if 'single_exon is enabled'
correct_est_fusion=0 #limits use of ESTs in annotation to avoid fusion genes

tries=2 #number of times to try a contig if there is a failure for some reason
clean_try=0 #remove all data from previous run before retrying, 1 = yes, 0 = no
clean_up=0 #removes theVoid directory with individual analysis files, 1 = yes, 0 = no
TMP=/scratch/44829956 #specify a directory other than the system default temporary directory for temporary files


```

```bash
#-----Genome (these are always required)
genome=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.fasta #genome sequence (fasta file or fasta embeded in GFF3 file)
organism_type=eukaryotic #eukaryotic or prokaryotic. Default is eukaryotic

#-----Re-annotation Using MAKER Derived GFF3
maker_gff= #MAKER derived GFF3 file
est_pass=0 #use ESTs in maker_gff: 1 = yes, 0 = no
altest_pass=0 #use alternate organism ESTs in maker_gff: 1 = yes, 0 = no
protein_pass=0 #use protein alignments in maker_gff: 1 = yes, 0 = no
rm_pass=0 #use repeats in maker_gff: 1 = yes, 0 = no
model_pass=0 #use gene models in maker_gff: 1 = yes, 0 = no
pred_pass=0 #use ab-initio predictions in maker_gff: 1 = yes, 0 = no
other_pass=0 #passthrough anyything else in maker_gff: 1 = yes, 0 = no

#-----EST Evidence (for best results provide a file for at least one)
est= #set of ESTs or assembled mRNA-seq in fasta format
altest= #EST/cDNA sequence file in fasta format from an alternate organism
est_gff=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output_1/Trypodendron_lineatum.all.maker.noseq.est2genome.gff #aligned ESTs or mRNA-seq from an external GFF3 file
altest_gff= #aligned ESTs from a closly relate species in GFF3 format

#-----Protein Homology Evidence (for best results provide a file for at least one)
protein=  #protein sequence file in fasta format (i.e. from mutiple organisms)
protein_gff=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output_1/Trypodendron_lineatum.all.maker.noseq.protein2genome.gff  #aligned protein homology evidence from an external GFF3 file

#-----Repeat Masking (leave values blank to skip repeat masking)
model_org= #select a model organism for RepBase masking in RepeatMasker
rmlib= #provide an organism specific repeat library in fasta format for RepeatMasker
repeat_protein= #provide a fasta file of transposable element proteins for RepeatRunner
rm_gff=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER_R1/Trypodendron_lineatum.maker.output_1/Trypodendron_lineatum.all.maker.noseq.repeats.gff #pre-identified repeat elements from an external GFF3 file
prok_rm=0 #forces MAKER to repeatmask prokaryotes (no reason to change this), 1 = yes, 0 = no
softmask=1 #use soft-masking rather than hard-masking in BLAST (i.e. seg and dust filtering)

#-----Gene Prediction
snaphmm=/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/snap/params/Trypodendron_lineatum.hmm #SNAP HMM file
gmhmm= #GeneMark HMM file
augustus_species=Trypodendron_lineatum #Augustus gene prediction species model
fgenesh_par_file= #FGENESH parameter file
pred_gff= #ab-initio predictions from an external GFF3 file
model_gff= #annotated gene models from an external GFF3 file (annotation pass-through)
run_evm=0 #run EvidenceModeler, 1 = yes, 0 = no
est2genome=1 #infer gene predictions directly from ESTs, 1 = yes, 0 = no
protein2genome=1 #infer predictions from protein homology, 1 = yes, 0 = no
trna=1 #find tRNAs with tRNAscan, 1 = yes, 0 = no
snoscan_rrna= #rRNA file to have Snoscan find snoRNAs
snoscan_meth= #-O-methylation site fileto have Snoscan find snoRNAs
unmask=0 #also run ab-initio prediction programs on unmasked sequence, 1 = yes, 0 = no
allow_overlap=0 #allowed gene overlap fraction (value from 0 to 1, blank for default)

#-----Other Annotation Feature Types (features MAKER doesn't recognize)
other_gff= #extra features to pass-through to final MAKER generated GFF3 file

#-----External Application Behavior Options
alt_peptide=C #amino acid used to replace non-standard amino acids in BLAST databases
cpus=16 #max number of cpus to use in BLAST and RepeatMasker (not for MPI, leave 1 when using MPI)

#-----MAKER Behavior Options
max_dna_len=100000 #length for dividing up contigs into chunks (increases/decreases memory usage)
min_contig=1 #skip genome contigs below this length (under 10kb are often useless)

pred_flank=200 #flank for extending evidence clusters sent to gene predictors
pred_stats=0 #report AED and QI statistics for all predictions as well as models
AED_threshold=1 #Maximum Annotation Edit Distance allowed (bound by 0 and 1)
min_protein=0 #require at least this many amino acids in predicted proteins
alt_splice=0 #Take extra steps to try and find alternative splicing, 1 = yes, 0 = no
always_complete=0 #extra steps to force start and stop codons, 1 = yes, 0 = no
map_forward=0 #map names and attributes forward from old GFF3 genes, 1 = yes, 0 = no
keep_preds=0 #Concordance threshold to add unsupported gene prediction (bound by 0 and 1)

split_hit=10000 #length for the splitting of hits (expected max intron size for evidence alignments)
min_intron=20 #minimum intron length (used for alignment polishing)
single_exon=0 #consider single exon EST evidence when generating annotations, 1 = yes, 0 = no
single_length=250 #min length required for single exon ESTs if 'single_exon is enabled'
correct_est_fusion=0 #limits use of ESTs in annotation to avoid fusion genes

tries=2 #number of times to try a contig if there is a failure for some reason
clean_try=0 #remove all data from previous run before retrying, 1 = yes, 0 = no
clean_up=0 #removes theVoid directory with individual analysis files, 1 = yes, 0 = no
TMP=/scratch/44891378 #specify a directory other than the system default temporary directory for temporary files

```

A key strength of the MAKER pipeline is its  **iterative design** . We use the gene models generated in a previous round to refine and train the *ab initio* prediction algorithms (e.g., AUGUSTUS and SNAP), which in turn leads to better gene structure inference in the following round. This cycle involves repeating the annotation process (steps 4 and 5). The recommended best practice is to complete a minimum of three total MAKER rounds, as gains in accuracy typically start to decrease thereafter. Care must be taken to prevent the **overtraining** of the predictors. A simple method for evaluating the success of successive rounds and determining the stopping point is:

**Comparing the number of predicted gene models and their resulting lengths after each iteration.**  You can find the script `AED_cdf_generator.pl` [here](https://github.com/mscampbell/Genome_annotation/blob/master/AED_cdf_generator.pl)

```bash
perl AED_cdf_generator.pl -b 0.025 Trypodendron_lineatum_master_datastore_index.all.makerR2.augustus.snap.gff

```

I run the `AED_cdf_generator.pl` after each round, to plot later the improvement of the annotation.

**A PLUS**

I  ran BRAKER to produce the gff file to merge with MAKER genome annotation.

#### BRAKER and MAKER Round 4

```bash
#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p node
#SBATCH -t 7-00:00:00
#SBATCH -J BRAKER_R2_gff
#SBATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se




singularity exec braker3.sif braker.pl --genome=Trypodendron_lineatum.fna \
--prot_seq=CD_HIT_Coleoptera_Evidence_Refseq_2.fasta,CD_HIT_refseq_db.fasta \
--rnaseq_sets_ids=P29459_105_S108_L004_R1_001_val_1,P29459_105_S108_L004_R2_001_val_2,P29459_201_S109_L004_R1_001_val_1,P29459_201_S109_L004_R2_001_val_2,P29459_202_S110_L004_R1_001_val_1,P29459_202_S110_L004_R2_001_val_2,P29459_203_S111_L004_R1_001_val_1,P29459_203_S111_L004_R2_001_val_2,P29459_204_S112_L004_R1_001_val_1,P29459_204_S112_L004_R2_001_val_2,P29459_206_S113_L004_R1_001_val_1,P29459_206_S113_L004_R2_001_val_2,P29459_208_S114_L004_R1_001_val_1,P29459_208_S114_L004_R2_001_val_2,P29459_209_S115_L004_R1_001_val_1,P29459_209_S115_L004_R2_001_val_2,P29459_210_S116_L004_R1_001_val_1,P29459_210_S116_L004_R2_001_val_2,P29459_211_S117_L004_R1_001_val_1,P29459_211_S117_L004_R2_001_val_2,P29459_212_S118_L004_R1_001_val_1,P29459_212_S118_L004_R2_001_val_2 \
--rnaseq_sets_dirs=/proj/snic2022-23-541/Beetle_project/Analysis/Trimgalore \
--min_contig=10000
```

```bash
#-----Genome (these are always required)
genome=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER/Trypodendron_lineatum.fasta #genome sequence (fasta file or fasta embeded in GFF3 file)
organism_type=eukaryotic #eukaryotic or prokaryotic. Default is eukaryotic

#-----Re-annotation Using MAKER Derived GFF3
maker_gff=/crex/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER/Trypodendron_lineatum.maker.output_R2_AS/Trypodendron_lineatum_master_datastore_index.all.makerR2.augustus.snap.gff #MAKER derived GFF3 file
est_pass=1 #use ESTs in maker_gff: 1 = yes, 0 = no
altest_pass=1 #use alternate organism ESTs in maker_gff: 1 = yes, 0 = no
protein_pass=1 #use protein alignments in maker_gff: 1 = yes, 0 = no
rm_pass=1 #use repeats in maker_gff: 1 = yes, 0 = no
model_pass=1 #use gene models in maker_gff: 1 = yes, 0 = no
pred_pass=1 #use ab-initio predictions in maker_gff: 1 = yes, 0 = no
other_pass=0 #passthrough anyything else in maker_gff: 1 = yes, 0 = no

#-----EST Evidence (for best results provide a file for at least one)
est= #set of ESTs or assembled mRNA-seq in fasta format
altest= #EST/cDNA sequence file in fasta format from an alternate organism
est_gff= #aligned ESTs or mRNA-seq from an external GFF3 file
altest_gff= #aligned ESTs from a closly relate species in GFF3 format

#-----Protein Homology Evidence (for best results provide a file for at least one)
protein=  #protein sequence file in fasta format (i.e. from mutiple organisms)
protein_gff=  #aligned protein homology evidence from an external GFF3 file

#-----Repeat Masking (leave values blank to skip repeat masking)
model_org= #select a model organism for RepBase masking in RepeatMasker
rmlib= #provide an organism specific repeat library in fasta format for RepeatMasker
repeat_protein= #provide a fasta file of transposable element proteins for RepeatRunner
rm_gff= #pre-identified repeat elements from an external GFF3 file
prok_rm=0 #forces MAKER to repeatmask prokaryotes (no reason to change this), 1 = yes, 0 = no
softmask=1 #use soft-masking rather than hard-masking in BLAST (i.e. seg and dust filtering)

#-----Gene Prediction
snaphmm=/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/snapR2/Trypodendron_lineatum_makerR2.hmm #SNAP HMM file
gmhmm= #GeneMark HMM file
augustus_species=Trypodendron_lineatum #Augustus gene prediction species model
fgenesh_par_file= #FGENESH parameter file
pred_gff=pred_gff=braker.gff3 #ab-initio predictions from an external GFF3 file
model_gff= #annotated gene models from an external GFF3 file (annotation pass-through)
run_evm=0 #run EvidenceModeler, 1 = yes, 0 = no
est2genome=0 #infer gene predictions directly from ESTs, 1 = yes, 0 = no
protein2genome=0 #infer predictions from protein homology, 1 = yes, 0 = no
trna=0 #find tRNAs with tRNAscan, 1 = yes, 0 = no
snoscan_rrna= #rRNA file to have Snoscan find snoRNAs
snoscan_meth= #-O-methylation site fileto have Snoscan find snoRNAs
unmask=0 #also run ab-initio prediction programs on unmasked sequence, 1 = yes, 0 = no
allow_overlap=0 #allowed gene overlap fraction (value from 0 to 1, blank for default)

#-----Other Annotation Feature Types (features MAKER doesn't recognize)
other_gff= #extra features to pass-through to final MAKER generated GFF3 file

#-----External Application Behavior Options
alt_peptide=C #amino acid used to replace non-standard amino acids in BLAST databases
cpus=16 #max number of cpus to use in BLAST and RepeatMasker (not for MPI, leave 1 when using MPI)

#-----MAKER Behavior Options
max_dna_len=100000 #length for dividing up contigs into chunks (increases/decreases memory usage)
min_contig=1 #skip genome contigs below this length (under 10kb are often useless)

pred_flank=200 #flank for extending evidence clusters sent to gene predictors
pred_stats=0 #report AED and QI statistics for all predictions as well as models
AED_threshold=1 #Maximum Annotation Edit Distance allowed (bound by 0 and 1)
min_protein=0 #require at least this many amino acids in predicted proteins
alt_splice=0 #Take extra steps to try and find alternative splicing, 1 = yes, 0 = no
always_complete=0 #extra steps to force start and stop codons, 1 = yes, 0 = no
map_forward=0 #map names and attributes forward from old GFF3 genes, 1 = yes, 0 = no
keep_preds=0 #Concordance threshold to add unsupported gene prediction (bound by 0 and 1)

split_hit=10000 #length for the splitting of hits (expected max intron size for evidence alignments)
min_intron=20 #minimum intron length (used for alignment polishing)
single_exon=0 #consider single exon EST evidence when generating annotations, 1 = yes, 0 = no
single_length=250 #min length required for single exon ESTs if 'single_exon is enabled'
correct_est_fusion=0 #limits use of ESTs in annotation to avoid fusion genes

tries=2 #number of times to try a contig if there is a failure for some reason
clean_try=0 #remove all data from previous run before retrying, 1 = yes, 0 = no
clean_up=0 #removes theVoid directory with individual analysis files, 1 = yes, 0 = no
TMP=/scratch/44970268 #specify a directory other than the system default temporary directory for temporary files

```

**Comparing the number of predicted gene models and their resulting lengths after each iteration.**  You can find the script `AED_cdf_generator.pl` [here](https://github.com/mscampbell/Genome_annotation/blob/master/AED_cdf_generator.pl)

```bash
perl AED_cdf_generator.pl -b 0.025 Trypodendron_lineatum_master_datastore_index.all.makerR2.augustus.snap.gff

```

#### To count gene models after each round

```
cat <roundN.full.gff> | awk '{ if ($3 == "gene") print $0 }' | awk '{ sum += ($5 - $4) } END { print NR, sum / NR }'

```

#### Internal MAKER Statistics (Accuracy)

MAKER itself provides two primary metrics within the final GFF3 output that evaluate how well each gene model is supported by the input evidence (ESTs, proteins, and *ab-initio* predictions).

#### Annotation Edit Distance (AED)

* **What it is:** The most important MAKER metric. It measures the congruence between the predicted gene model and all supporting evidence alignments.
* **Scale:** The value ranges from 0 to 1.

  * **AED = 0:** The gene model perfectly matches the supporting evidence (the highest quality).
  * **AED = 1:** The gene model has absolutely no support from the provided evidence.
* **Interpretation:** You typically want to filter your final gene set to include models with an **$\text{AED} \leq 0.5$**, and a high-quality subset should have **$\text{AED} \leq 0.3$**. Tracking the **average AED** across MAKER rounds is a key indicator of improvement.
* MAKER Quality Index (QI)
* **What it is:** A secondary metric that tracks the proportion of evidence types (e.g., EST, protein, SNAP, AUGUSTUS) that support the final model.

---

## Completeness Assessment (BUSCO)

The **Benchmarking Universal Single-Copy Orthologs (BUSCO)** tool is the gold standard for evaluating the **completeness** of a genome assembly or its annotation.

* **How it works:** BUSCO compares your predicted protein set (derived from the MAKER GFF3) against a large, lineage-specific database of genes that are expected to be present as single copies across nearly all species in that taxonomic group (e.g., Arthropoda, Coleoptera).
* **Output Categories:**
  * **Complete:** The gene is found and appears full-length.
  * **Duplicated:** The gene is found more than once (may indicate over-assembly or genuine duplication).
  * **Fragmented:** Only a partial sequence of the gene is found.
  * **Missing:** The gene is not found in the annotation.
* **Interpretation:** A good annotation typically aims for a high percentage of **Complete** BUSCOs (often **$\geq 90\%$**) and low percentages of Duplicated, Fragmented, and Missing genes.

```bash
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
sbatch --export=QRY=/proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER/Trypodendron_lineatum.maker.output/Trypodendron_lineatum.all.maker.transcripts.fasta
```

### **Functional annotation**

After obtaining the final set of predicted protein sequences from MAKER, the next critical step is  **Functional Annotation** . This process assigns biological roles, protein domains, and Gene Ontology (GO) terms to the predicted proteins, giving biological meaning to the genomic structures.

We use **InterProScan** for this step. InterProScan integrates signatures from various primary protein signature databases (known as "applications") to provide a comprehensive functional analysis.

The first script focuses on annotating **all protein sequences** derived from the final MAKER gene models.

```bash
#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 16
#SBATCH -t 2-00:00:00
#SBATCH -J InterPro_maker
#BATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se


module load bioinfo-tools InterProScan/5.62-94.0

interproscan.sh -i /proj/snic2022-23-541/Beetle_project/Analysis/MAKER/MAKER/Trypod
endron_lineatum.maker.output/Trypodendron_lineatum.all.maker.proteins.fasta -goterm
s -t p -f TSV,XML -appl Gene3D,ProSitePatterns,PANTHER,CDD,Pfam,SUPERFAMILY,TMHMM -
b /proj/snic2022-23-541/Beetle_project/Analysis/InterPro/Tlin_maker


####

#!/bin/bash
#SBATCH -A naiss2023-5-461
#SBATCH -p core -n 12
#SBATCH -t 2-00:00:00
#SBATCH -J InterPro_DB
#BATCH --mail-type=all
#SBATCH --mail-user=zaide.montes_ortiz@biol.lu.se


module load bioinfo-tools InterProScan/5.62-94.0

interproscan.sh -i /proj/snic2022-23-541/Beetle_project/Analysis/CD-HIT/MAKER_R4.fasta -g
oterms -t p -f TSV,XML -appl Gene3D,ProSitePatterns,PANTHER,CDD,Pfam,SUPERFAMILY,TMHMM -b /proj/
snic2022-23-541/Beetle_project/Analysis/InterPro/Tlin_InterPro_MAKER_final
```

### **Orthologs gene detection**

The final stage of the pipeline involved comparative genomics to identify **orthologous gene groups** and assign functional roles. This is essential for understanding gene family evolution, including expansions and contractions, within the beetle lineage.

#### 1. Preparing the Comparative Dataset

To ensure robust orthology inference, a comprehensive set of protein sequences from multiple related species was assembled:

* **Reference Data Acquisition:** Non-redundant, high-quality protein sequences were downloaded from the **NCBI RefSeq** database. The search utilized a targeted query (e.g., `("beetle species"[Organism] AND refseq[filter])`) for ten different beetle species.
* **Species Included:** Proteins from the newly annotated *T. lineatum* were combined with nine other well-annotated beetle species ( *I. typographus* ,  *D. ponderosae* ,  *H. hampei* ,  *T. castaneum* ,  *A. glabripennis* ,  *C. maculatus* ,  *L. decemlineata* ,  *D. virgifera* , and  *Aethina tumida* ) to create a diverse dataset for orthology comparison.#### 2. Orthology Inference with OrthoFinder

**[OrthoFinder](https://github.com/davidemms/OrthoFinder) (v2.5.2)** was used to group the protein sequences into **orthogroups** (sets of genes descended from a single gene in the last common ancestor).

* **Methodology:** The program was run using rigorous, sequence-based methods to accurately infer evolutionary relationships:
  * **Gene Tree Inference:** `-M msa` (gene tree inference was based on Multiple Sequence Alignment).
  * **Multiple Sequence Alignment (MSA):** `-A mafft` (using the MAFFT aligner for high accuracy).
* **Output:** The result was a comprehensive classification of all 10 beetle proteomes into orthogroups, forming the foundation for evolutionary analysis.

```bash
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
```

### Functional Assignment to Orthogroups

Before performing evolutionary rate analysis, the orthogroups needed biological meaning. Function was assigned using two complementary methods:

* **InterProScan (v2.1.4-2):** This tool was run on the orthogroup sequences to assign **protein domains** and  **Gene Ontology (GO) terms** , providing structural and functional information.
* **BLAST Searches:** A second functional layer was added by performing BLAST searches (e-value threshold **$\leq 1\text{e-}5$**) against the comprehensive  **NCBI non-redundant insect database** . Only non-redundant and significant hits were retained.

**Critical Role:** This functional annotation of orthogroups was the final necessary step. It allowed the subsequent **CAFE analysis** (which detects significantly expanded or contracted gene families) to be biologically interpreted, linking evolutionary changes to specific protein functions or pathways.

### Gene Family Evolution Analysis with CAFE

The final step in the comparative genomics pipeline is the  **Computational Analysis of gene Family Evolution (CAFE)** . The purpose of CAFE is to statistically analyze the observed changes in gene family sizes (expansions and contractions) across the beetle phylogeny, accounting for the evolutionary history of the species.

**What CAFE Does**

CAFE utilizes a **birth-and-death stochastic process** to model the gain (birth) and loss (death) of genes within families over time across the branches of a phylogenetic tree. This model allows us to:

1. Calculate a single parameter (**$\lambda$**) representing the average rate of gene family size change across the entire tree.
2. Determine the **statistical significance** of gene family expansions or contractions in specific lineages.

   Before running the analysis, CAFE5 was installed on the high-performance computing cluster (UPPMAX) using the following steps:
3. **Download and Extract:** The CAFE5 source code was downloaded and extracted.
   **Bash**

   ```
   wget https://github.com/hahnlab/5/releases/download/v5.1/CAFE5-5.1.0.tar.gz
   tar -xvf CAFE5-5.1.0.tar.gz
   cd CAFE5/
   ```
4. **Load Dependencies:** Required environment modules were loaded, specifically the `gcc` compiler and general `bioinfo-tools`.
   **Bash**

   ```
   module load bioinfo-tools
   module load gcc/9.2.0
   ```
5. **Compile:** The software was configured and compiled to create the executable binary.
   **Bash**

   ```
   ./configure
   make
   ```

   The final executable `cafe5` is located in the `CAFE5/bin/` directory.

   **Input File Preparation**

CAFE requires two main input files derived from the **OrthoFinder** output: the gene family size count matrix and the phylogenetic tree.

**1.Creating the CAFE Gene Count Input File**

The `Orthogroups.GeneCount.tsv` file from OrthoFinder needed reformatting to meet CAFE's specific input structure.

* **Goal:** Remove the last column (`Total`) and add a descriptive `Desc` column at the beginning.

**Bash**

```
# This is an atomic command sequence
awk 'OFS="\t" {$NF=""; print}' Orthogroups.GeneCount.tsv > tmp && awk '{print "(null)""\t"$0}' tmp > cafe.input.tsv && sed -i '1s/(null)/Desc/g' cafe.input.tsv && rm tmp

# In detail:
# 1. 'awk ... > tmp': Removes the final (Total) column and pipes output to a temporary file (tmp).
# 2. 'awk ... > cafe.input.tsv': Prepends "(null)" and a tab to every line in 'tmp', saving to the final input file.
# 3. 'sed -i ...': Replaces "(null)" with the required header "Desc" only on the first line.
# 4. 'rm tmp': Cleans up the temporary file.
```

**2.****Filtering Gene Families**

To ensure the statistical model is robust, gene families were filtered using the `clade_and_size_filter.py` script:

**Bash**

```
python ../tutorial/clade_and_size_filter.py -i cafe.input.tsv -o filtered.cafe.input.tsv -s 2> filtered.log
```

* **Clade Filter:** Only gene families with copies in at least two species were kept, which is a requirement for ancestral state reconstruction.
* **Size Filter:** Gene families with **over 100 gene copies** in any species were separated. Large families can introduce excessive variance and compromise the estimation of the birth-death rate (**$\lambda$**). The smaller, filtered file (`filtered.cafe.input.tsv`) is used to estimate **$\lambda$**, which is then applied to the larger families.

  3. **Converting the Species Tree to Ultrametric**

CAFE requires a  **time-scaled, ultrametric tree** . An ultrametric tree is rooted and has edge lengths such that all tips (species) are equidistant from the root, often representing evolutionary time based on a molecular clock.

This conversion was performed in **$\text{R}$** using the `ape` package:

**R**

```
library(ape)

# Read the phylogenetic tree inferred by OrthoFinder
tree <- read.tree("SpeciesTree_rooted.txt")

# Convert the tree to ultrametric using the chronos function
ultrametric_tree <- chronos(tree)

# Save the time-scaled tree for CAFE input
write.tree(ultrametric_tree, file="SpeciesTree_rooted_ultrametric.txt")
```

#### Running CAFE

### The main CAFE analysis was executed on the cluster using the prepared files:

**Bash**

```
# ... SLURM header for resource allocation ...

module load bioinfo-tools
module load gcc/9.2.0

../bin/cafe5 -i filtered.cafe.input.tsv -t SpeciesTree_rooted_ultrametric.txt
```

* **Input (`-i`):** The filtered gene count matrix (`filtered.cafe.input.tsv`).
* **Tree (`-t`):** The time-scaled ultrametric tree (`SpeciesTree_rooted_ultrametric.txt`).

  4. **Visualizing Results**

The final results from CAFE were then visualized using the dedicated plotting tool **CafePlotter** to generate publication-quality figures, including the gene family changes mapped onto the phylogenetic tree.

```bash
# ... SLURM header for resource allocation ...

/home/zaidemo/.local/bin/cafeplotter -i results/ -o plot_2/
```

---

## Conclusion: Moving Forward

The iterative process of annotation and comparative genomics is a continuous cycle of improvement and learning. I conclude this tutorial by embracing the spirit of innovation in bioinformatics. It could be better, I know!  I hope you finish on time!!!

> **“The most dangerous phrase in the language is, ‘We've always done it this way.’”**
>
> — Grace Hopper

---
