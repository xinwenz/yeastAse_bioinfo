#!/bin/bash
#$ -pe openmp 32-128

module load brew/bwa
# bwa versiooooon 0.7.15-r1140
#f=$(ls *.fasta | sort | head -n $SGE_TASK_ID | tail -n 1) 
#b=$(basename $f .fasta)

prev="rm11_E"

#ln -s ../canu0finisher/rm11/improved.fasta ${prev}.fasta
bwa index -p ${prev} ${prev}.fasta

bwa mem -t $NSLOTS ${prev} ../0short/rm11_r1_trm.fastq ../0short/rm11_r2_trm.fastq > ${prev}.sam
