#!/bin/bash
#$ -N bowtie2Index
#$ -t 1-5 

module load bowtie2/2.2.7

f=$(find -iname '*.fasta'| sort | head -n $SGE_TASK_ID | tail -n 1 )
b=${f%.fasta}

bowtie2-build $f $b
