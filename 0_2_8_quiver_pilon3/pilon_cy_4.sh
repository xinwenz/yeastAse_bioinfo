#!/bin/bash
#$ -N pilon_cy_4
#$ -pe openmp 8-64
#$ -t 1-2 

lst="cbs432 yps128"
f=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

module load jje/pilon
#version 1.16


prev=${f}_4
nex=${f}_5

pilon --genome ${prev}.fasta --frags ${prev}.bam --output ${nex} --threads $NSLOTS
