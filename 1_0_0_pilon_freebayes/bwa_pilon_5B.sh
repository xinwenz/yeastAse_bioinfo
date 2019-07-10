#!/bin/bash
#$ -pe openmp 32-64
#$ -t 1-2
#$ -ckpt restart 

lst='rm11_B yps128_5'
f=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

lst2='rm11 yps128'
R=$(echo $lst2 | cut -d" " -f$SGE_TASK_ID)

module load brew/bwa
module load samtools/1.9

bwa index -p $f ${f}.fasta

bwa mem -t $NSLOTS ${f} ../0short/${R}_r1_trm.fastq ../0short/${R}_r2_trm.fastq | samtools sort -T $SGE_TASK_ID --output-fmt bam > ${f}.bam 
