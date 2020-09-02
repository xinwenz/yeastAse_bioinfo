#!/bin/bash
#$ -t 1-40

g=$SGE_TASK_ID
f=$(ls hst_*/*.BPNAME | head -n $g | tail -n 1)

python2 ~/software/count_pileup.py $f > $f.snpCount
