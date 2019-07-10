#!/bin/bash
#$ -N fastq2a
#$ -t 1-2 

file=$(ls *.fastq | head -n $SGE_TASK_ID | tail -n 1 )
newfile=$(basename $file .fastq).fasta
bioawk -c fastx '{print ">"$name; print $seq}' $file > $newfile 
