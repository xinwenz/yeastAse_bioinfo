#!/bin/bash
#$ -N gzip_trim
#$ -t 1-8 

f=$(ls *_R[12].fastq | head -n $SGE_TASK_ID | tail -n 1 )
gzip $f
