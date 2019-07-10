#!/bin/bash
#$ -t 1-30
#$ -pe openmp 8-32 

module load samtools/1.3
module load bowtie2/2.2.7

ref=yps128_5
r1=$(ls ../0calibrate/deMx_trim/*_r1.fq.gz | sort| head -n $SGE_TASK_ID | tail -n 1) 
r2=${r1%_r1.fq.gz}_r2.fq.gz
out=$ref/$(basename $r1 _r1.fq.gz).bam

#bowtie2 -p $NSLOTS -k 20 -x $ref -1 $r1 -2 $r2 | samtools view -b | samtools sort --threads $NSLOTS -T $SGE_TASK_ID > ${out}

# 12/10/2018 redo... 
bowtie2 -p $NSLOTS -x $ref -1 $r1 -2 $r2 | samtools view -b | samtools sort --threads $NSLOTS -T $SGE_TASK_ID > ${out}
