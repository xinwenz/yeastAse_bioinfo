#!/bin/bash
#$ -N augustus_all
#$ -t 1-2
#$ -ckpt blcr

module load augustus/3.2.1
if [ $SGE_TASK_ID -eq 1 ]
then 
augustus --species=saccharomyces_cerevisiae_S288C yps128_5.fasta
else
augustus --species=saccharomyces_cerevisiae_rm11-1a_1 rm11_B.fasta
fi
