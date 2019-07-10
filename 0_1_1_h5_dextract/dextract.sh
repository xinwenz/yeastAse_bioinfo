#!/bin/bash
#$ -N dextract_bax
#$ -t 1-17 

module load dextractor
folders=$(ls -d ../0h5/*/)
f=$(echo $folders | cut -d" " -f$SGE_TASK_ID )
name=$(basename $f)

dextract -q -s800 -l500 $f/*.bax.h5 > "$name".fastq 
