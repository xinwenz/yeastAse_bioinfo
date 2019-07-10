#!/bin/bash
#$ -pe openmp 16-128

module load brew/bwa
module load samtools/1.8-11
# version 0.7.15-r1140
module load jje/pilon
#version 1.16

prev="rm11_D"
nex='rm11_E'

bwa index -p $prev ${prev}.fasta

bwa mem -t $NSLOTS ${prev} ../0short/rm11_r1_trm.fastq ../0short/rm11_r2_trm.fastq | samtools sort -T $prev --output-fmt bam > ${prev}.bam

samtools index ${prev}.bam

pilon --genome ${prev}.fasta --frags ${prev}.bam --output ${nex} --threads $NSLOTS


