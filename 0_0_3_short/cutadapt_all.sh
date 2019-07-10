#!/bin/bash
#$ -N cutadapt_all
#$ -t 1-6 

# need python2.6,
# python2.7 not work for cutadapt. 
# use default python

#file=$( ls ../0short/*_r[12].fastq | head -n $SGE_TASK_ID | tail -n 1 )
#newfile=$(basename $file .fastq)_trim.fastq
#cutadapt -a CTGTCTCTTATA -o $newfile $file

file=$( ls *_trim.fastq | head -n $SGE_TASK_ID | tail -n 1)
newfile=${file%_trim.fastq}_trm.fastq
sed 's/^$/N/' $file > $newfile 


