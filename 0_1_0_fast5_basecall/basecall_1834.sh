#!/bin/bash 
#$ -N basecall_1834fast5
#$ -pe openmp 8-64
#$ -ckpt restart
#$ -t 1-4

nf=$(($SGE_TASK_ID-1))
read_fast5_basecaller.py -t $NSLOTS -s ./analysis/bc1834_$nf/ -q 0 -i ./raw/20171122_1834_DNA015/fast5/$nf -f FLO-MIN106 -k SQK-RAD003 
