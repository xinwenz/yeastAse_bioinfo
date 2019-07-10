#!/bin/bash
#$ -N download_cali
#$ -t 1-4 


lst=""http://slimsdata.genomecenter.ucdavis.edu/Data/95k8cth6t/Unaligned/Project_JEXZ_D130_cDNA/D130-cDNA_S1_R1_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/95k8cth6t/Unaligned/Project_JEXZ_D130_cDNA/D130-cDNA_S1_R2_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/95k8cth6t/Unaligned/Project_JEXZ_D130_cDNA/D130-cDNA_S1_R3_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/95k8cth6t/Unaligned/Project_JEXZ_D130_cDNA/D130-cDNA_S1_R4_001.fastq.gz""

addr=$(echo $lst | cut -d" " -f$SGE_TASK_ID)
outf=$(basename $addr)
wget $addr -O $outf
