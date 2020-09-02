#!/bin/bash 
#$ -t 1-20
module load bedtools
g=$SGE_TASK_ID
f=$(ls *.BPNAME | head -n $g | tail -n 1 )


python2 ~/software/count_pileup.py $f > $f.snpCount

