#!/bin/bash
#$ -N bwa_pilon_4
#$ -pe openmp 12-64
#$ -t 1-2 

lst="cbs432 yps128"
f=$(echo $lst | cut -d" " -f$SGE_TASK_ID) 

module load brew/bwa
module load samtools/1.3
# version 0.7.15-r1140

prev=${f}_4

bwa index -p $prev ${prev}.fasta

bwa mem -t $NSLOTS ${prev} ../0short/${f}_r1_trim.fastq ../0short/${f}_r2_trim.fastq | samtools sort -T $SGE_TASK_ID --output-fmt bam > ${prev}.bam

samtools index ${prev}.bam
