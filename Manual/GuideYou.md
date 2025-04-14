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
| **Callosobruchus maculatus** | *Chrysomelidae*              | **GCA_951848785.1** |
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

**Hham**, Hypothenemus hampei;

**Ityp**, Ips typographus;

**Ldec**, Leptinotarsa decemlineata;

**Nves**, Nicrophorus vespilloides;

**Otau**, Onthophagus taurus;

**Tcas**, Tribolium castaneum;

## Analysis

## Results
