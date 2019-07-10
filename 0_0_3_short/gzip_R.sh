#!/bin/bash
#$ -N gzip_R
#$ -t 1-2 

f=$(ls *_L001*.fastq | head -n $SGE_TASK_ID | tail -n 1 )
gzip $f
