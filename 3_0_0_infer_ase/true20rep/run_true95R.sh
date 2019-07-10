#!/bin/bash
#$ -t 1-560

module load R 

myargs=$(head -n $SGE_TASK_ID arg_true.txt | tail -n1)
Rscript true95_hpc.R $myargs

