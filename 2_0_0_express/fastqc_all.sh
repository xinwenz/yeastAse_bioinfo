#!/bin/bash
#$ -N fastqc_all
#$ -t 1-8 

module load fastqc

file=$(ls *_R[12].fastq | sort | head -n $SGE_TASK_ID | tail -n 1)
fastqc $file 

