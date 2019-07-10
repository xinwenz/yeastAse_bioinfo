#!/bin/bash
#$ -t 1-20
#$ -ckpt restart 

g=$SGE_TASK_ID

f1=$(ls ../1_5Bsnp_yps128_5/*.BPNAME.gCount | head -n $g | tail -n 1 ) 
f2=$(ls ../1_5Bsnp_rm11_B/*.BPNAME.gCount | head -n $g | tail -n 1 )
outp=$(basename $f1 .pileup.BPNAME.gCount)

python2 ~/software/yps5rmB_gc.py $f1 $f2 > $outp.yr.gCount  
