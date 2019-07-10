#!/bin/bash
#$ -N download_h5
#$ -t 1-17

address=$(head -n $SGE_TASK_ID sra_address.txt | tail -n 1)
if [ $SGE_TASK_ID -lt 11 ]
then 
	wget $address -O yps128_h5_"$SGE_TASK_ID".tgz
else
	num=$((SGE_TASK_ID-10))	
	wget $address -O cbs432_h5_"$num".tgz  
fi
