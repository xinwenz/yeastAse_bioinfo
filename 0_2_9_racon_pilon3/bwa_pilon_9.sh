#!/bin/bash
#$ -N bwa_pilon_9
#$ -pe openmp 12-64

module load brew/bwa
module load samtools/1.3
# version 0.7.15-r1140

prev="rm11_9"

bwa index -p $prev ${prev}.fasta

bwa mem -t $NSLOTS ${prev} ../0short/rm11_r1_trim.fastq ../0short/rm11_r2_trim.fastq | samtools sort -T $SGE_TASK_ID --output-fmt bam > ${prev}.bam
samtools index ${prev}.bam
