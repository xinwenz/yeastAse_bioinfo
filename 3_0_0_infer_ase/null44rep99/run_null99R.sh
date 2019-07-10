#!/bin/bash
#$ -t 1-50

module load R 

myargs=$(head -n $SGE_TASK_ID args_num_smp.txt | tail -n1)
Rscript null99_hpc.R $myargs

