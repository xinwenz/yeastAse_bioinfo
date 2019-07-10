#!/bin/bash
#$ -N basecall_1758fast5
#$ -pe openmp 8-64
#$ -ckpt restart 
#$ -t 1-12

nf=$(($SGE_TASK_ID-1))
read_fast5_basecaller.py -t $NSLOTS -s ./analysis/bc1758_$nf -q 0 -i ./raw/20171121_1758_DNA003/fast5/$nf -f FLO-MIN106 -k SQK-RAD003
