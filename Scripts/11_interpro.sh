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

interproscan.sh -i /proj/snic2022-23-541/Beetle_project/Analysis/CD-HIT/Novel_sequences.fasta -goterms -t p -f TSV,XML -appl Gene3D,ProSitePatterns,PANTHER,CDD,Pfam,SUPERFAMILY,TMHMM -b /proj/snic2022-23-541/Beetle_project/Analysis/InterPro/Tlin_InterPro_Braker_novel