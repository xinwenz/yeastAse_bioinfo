#!/bin/bash
#$ -t 1-20 
g=$SGE_TASK_ID

f1=$(ls hst_rm11_B/*.BPNAME.groupCount | head -n $g | tail -n 1 ) 
f2=$(ls hst_yps128_5/*.BPNAME.groupCount | head -n $g | tail -n 1 )
outp=$(basename $f1 .pileup.BPNAME.groupCount)

python2 ~/software/yps5rmB_gc.py $f1 $f2 > 3_5Bsnp_yr/$outp.yr.gCount  
