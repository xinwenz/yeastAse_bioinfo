#!/bin/bash
#$ -N cat_seqsum
#$ -t 1-3 

#lst='1758 2208 1834'
#fls=$( echo $lst | cut -d" " -f$SGE_TASK_ID)
#cat ./analysis/fast5_basecall_output/bc"$fls"_*/sequencing_summary.txt > ./analysis/fastq_minionqc_output/bc"$fls"_seqsum.txt

lst='0740 2218 0012'
fls=$( echo $lst | cut -d" " -f$SGE_TASK_ID)
cat ../a0fast50basecall/bc"$fls"_yxz029_*/sequencing_summary.txt > bc"$fls"_yxz029_seqsum.txt
