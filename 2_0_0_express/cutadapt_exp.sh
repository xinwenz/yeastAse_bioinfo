#!/bin/bash
#$ -N cutadapt_exp
#$ -t 1-8

# need python2.6,
# python2.7 not work for cutadapt. 
# use default python

module load fastqc

file=$( ls *_R[12].fastq | head -n $SGE_TASK_ID | tail -n 1 )
newfile=$(basename $file .fastq)_trim.fastq
cutadapt -a CTGTCTCTTATA -o $newfile $file
fastqc $newfile

