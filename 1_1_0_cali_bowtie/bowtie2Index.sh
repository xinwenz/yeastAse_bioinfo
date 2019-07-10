#!/bin/bash 
#$ -N bowtie2Index
#$ -q epyc,pub8i,jje,bio,abio

module load bowtie2/2.2.7
for f in *.fasta
do 
bowtie2-build $f ${f%.fasta}
done
