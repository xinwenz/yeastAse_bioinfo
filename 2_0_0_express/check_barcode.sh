#!/bin/bash
#$ -N check_barcode
#$ -t 1-8 

file=$(ls *_I[12].fastq.gz | sort | head -n $SGE_TASK_ID | tail -n 1)
newname=$( basename $file .fastq.gz).txt

bioawk -c fastx '{print $seq}' $file | sort | uniq -c | sort -n -r | head -n 10 > $newname
