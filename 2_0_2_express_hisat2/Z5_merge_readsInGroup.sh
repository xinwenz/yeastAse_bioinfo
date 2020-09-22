#!/bin/bash
#$ -t 1-40

g=$SGE_TASK_ID
f=$(ls ./hst_*/*.BPNAME | head -n $g | tail -n 1)
reftmp=$(echo $f | cut -f2 -d"/")
ref=${reftmp:4:20}

awk 'NR==FNR {h[$1,$2] = $3; next} h[$1,$2]!=""{print h[$1,$2],$1,$2,$4,$5,$7,$8}' ./2_5Bsnp_filterGroup/${ref}_snpls_evdp_group $f > $f.group

LC_COLLATE=C sort -k1,1 $f.group > $f.group.sort
python2 ~/software/group_reads.py $f.group.sort > $f.groupCount

rm $f.group
rm $f.group.sort
