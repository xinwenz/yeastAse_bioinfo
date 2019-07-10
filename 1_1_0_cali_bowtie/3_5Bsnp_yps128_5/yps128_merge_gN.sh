#!/bin/bash 
#$ -t 1-20
#$ -ckpt restart
module load bedtools
g=$SGE_TASK_ID
f=$(ls *.BPNAME | head -n $g | tail -n 1 )

awk 'NR==FNR {h[$1,$2] = $3; next} {print h[$1,$2],$1,$2,$4,$5,$7,$8}' ../3_5Bsnp/yps128_5_snpls_evd_group $f > $f.group

sort -k1,1 $f.group > $f.group.sort
python2 ~/software/group_reads.py $f.group.sort > $f.gCount

rm $f.group.sort
rm $f.group 
