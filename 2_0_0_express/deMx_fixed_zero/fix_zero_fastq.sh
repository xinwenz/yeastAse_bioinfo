#!/bin/bash 
#$ -t 1-60 
#$ -q jje128 

f=$(ls ../deMx/*.fq.gz | head -n $SGE_TASK_ID | tail -n 1 )
fout=$(basename $f)
bioawk -c fastx '{if (length($seq) < 1) {print "@"$name"\nN\n+\nN"} else {print "@"$name"\n"$seq"\n+\n"$qual}}' $f | gzip > $fout
