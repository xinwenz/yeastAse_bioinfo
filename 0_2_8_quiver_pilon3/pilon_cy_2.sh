#!/bin/bash
#$ -N pilon_cy_2
#$ -pe openmp 8-64
#$ -t 1-2 

lst="cbs432 yps128"
f=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

module load jje/pilon
#version 1.16


prev=${f}_2
nex=${f}_3

pilon --genome ${prev}.fasta --frags ${prev}.bam --output ${nex} --threads $NSLOTS
