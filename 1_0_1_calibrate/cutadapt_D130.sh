#!/bin/bash
#$ -N cutadapt_D130
#$ -t 1-2 

# need python2.6,
# python2.7 not work for cutadapt. 
# use default python

file=$( ls D130_R[12].fastq | head -n $SGE_TASK_ID | tail -n 1 )
newfile=$(basename $file .fastq)_trim.fastq
cutadapt -a CTGTCTCTTATA -o $newfile $file

