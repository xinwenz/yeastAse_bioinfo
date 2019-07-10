#!/ bin/bash
#$ -N fastqc_D130

module load fastqc 
fastqc *_R[12].fastq
