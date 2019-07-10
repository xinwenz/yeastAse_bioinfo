#!/bin/bash
#$ -N bwa_racon_4
#$ -pe openmp 32-64

module load brew/bwa
# bwa versiooooon 0.7.15-r1140
#f=$(ls *.fasta | sort | head -n $SGE_TASK_ID | tail -n 1) 
#b=$(basename $f .fasta)

prev="rm11_4"

#ln -s ../canu0finisher/rm11/improved.fasta ${prev}.fasta
bwa index -p ${prev} ${prev}.fasta

bwa mem -x ont2d -t $NSLOTS ${prev} ../fast50basecall/rm11.fastq > ${prev}.sam
