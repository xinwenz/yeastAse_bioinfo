#!/bin/bash
#$ -N basecall_yxz029
#$ -pe openmp 8-64
#$ -ckpt restart

read_fast5_basecaller.py -t $NSLOTS -s ./bc0740_yxz029_0 -q 0 -i ../0_fast5/20180123_0740_yxz029/fast5/0 -f FLO-MIN106 -k SQK-RAD003
read_fast5_basecaller.py -t $NSLOTS -s ./bc0740_yxz029_1 -q 0 -i ../0_fast5/20180123_0740_yxz029/fast5/1 -f FLO-MIN106 -k SQK-RAD003
read_fast5_basecaller.py -t $NSLOTS -s ./bc2218_yxz029_0 -q 0 -i ../0_fast5/20180123_2218_yxz029/fast5/0 -f FLO-MIN106 -k SQK-RAD003
read_fast5_basecaller.py -t $NSLOTS -s ./bc0012_yxz029_0 -q 0 -i ../0_fast5/20180124_0012_yxz029/fast5/0 -f FLO-MIN106 -k SQK-RAD003
