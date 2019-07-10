#!/bin/bash
#$ -N combine_EJ_r1
#$ -t 1-30
#$ -q jje128 

fE=$(ls ../deMx_trim_E/*r1.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1)
fJ=$(ls ../deMx_trim_J/*r1.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1)

comb_EJ_tmp=$(basename $fE)
comb_EJ=${comb_EJ_tmp:2:20}

zcat $fE $fJ | gzip > $comb_EJ
