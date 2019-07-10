#!/bin/bash
#$ -pe openmp 16-128

module load brew/bwa
module load samtools/1.8-11
# version 0.7.15-r1140
module load jje/pilon
#version 1.16

prev="yps128_7"
nex='yps128_8'

bwa index -p $prev ${prev}.fasta

bwa mem -t $NSLOTS ${prev} ../0short/yps128_r1_trm.fastq ../0short/yps128_r2_trm.fastq | samtools sort -T $prev --output-fmt bam > ${prev}.bam

samtools index ${prev}.bam

pilon --genome ${prev}.fasta --frags ${prev}.bam --output ${nex} --threads $NSLOTS


