#!/bin/bash
#$ -t 1-20 

g=$SGE_TASK_ID

f1=$(ls ../hst_yps128_5/*.BPNAME.geneCount | head -n $g | tail -n 1 ) 
f2=$(ls ../hst_rm11_B/*.BPNAME.geneCount | head -n $g | tail -n 1 )
outp=$(basename $f1 .pileup.BPNAME.geneCount)

python2 ~/software/yps5rmB_gc.py $f1 $f2 > $outp.yr.geneCount  
