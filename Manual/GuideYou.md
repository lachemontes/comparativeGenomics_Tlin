# **Comparative genomics and orthology analysis of the striped ambrosia beetle,  *Trypodendron lineatum* : Functional, evolutionary, and ecological implications**

## Project Description

This project focuses on the comparative genomics and orthology analysis of  *Trypodendron lineatum* , a Holarctic pest with a unique xylem-boring behavior and fungal symbiosis. By assembling and annotating its genome using cutting-edge sequencing technologies, we revealed insights into its chemosensory adaptations, gene family dynamics, and evolutionary specialization. These findings contribute to understanding the functional, evolutionary, and ecological implications of its lifestyle and interactions within forest ecosystems.

## 

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
   * **If your data is larger than the available memory, you might need to consider distributed computing options or using a smaller subset of the data for analysis.**


### **Transcriptome sequencing, read mapping, and assembly**

### **Genome annotation and quality assessment**

### **Functional annotation and orthologs gene detection**

### **Gene family evolution (expansions and contractions)**

### **Reconstruction of phylogenetic trees**




## Results
