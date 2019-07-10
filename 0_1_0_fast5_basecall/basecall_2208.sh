#!/bin/bash 
#$ -N basecall_2208fast5
#$ -pe openmp 8-64
#$ -ckpt restart
#$ -t 1-9

nf=$(($SGE_TASK_ID-1))
read_fast5_basecaller.py -t $NSLOTS -s ./analysis/bc2208_$nf/ -q 0 -i ./raw/20171117_2208_YXZ003/fast5/$nf -f FLO-MIN106 -k SQK-RAD003 
