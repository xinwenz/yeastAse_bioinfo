#!/bin/bash
#$ -t 1-30
#$ -pe openmp 16-32
#$ -q epyc,jje128,jje

module load samtools/1.3
module load bowtie2/2.2.7

ref=rm11_B
r1=$(ls ../0express/deMx_fixed_zero/*_r1.fq.gz | sort| head -n $SGE_TASK_ID | tail -n 1) 
r2=${r1%_r1.fq.gz}_r2.fq.gz
out=bowtie2_rm11_B/$(basename $r1 _r1.fq.gz).bam

bowtie2 -p $NSLOTS -x $ref -1 $r1 -2 $r2 | samtools view -b | samtools sort --threads $NSLOTS -T $SGE_TASK_ID > ${out}
