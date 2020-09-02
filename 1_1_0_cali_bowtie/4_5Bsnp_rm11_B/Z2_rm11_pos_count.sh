#!/bin/bash
#$ -t 1-20 

input=$(ls *.BPNAME | head -n $SGE_TASK_ID | tail -n 1)
output=${input}.pCount

cut -f1,2,4 $input > $output
