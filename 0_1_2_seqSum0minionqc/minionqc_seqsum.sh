#!/bin/bash 
#$ -N minionqc_seqsum
#$ -t 1-6

module load R/3.4.1
nb=$SGE_TASK_ID
fl=$( ls *_seqsum.txt | head -n $nb | tail -n 1 )
bs=$( basename $fl _seqsum.txt )
Rscript ~/software/MinionQC.R -i $fl -o $bs 

