#!/bin/bash
#$ -q jje128

module load hisat2
for f in *.fasta
do
hisat2-build $f ${f%.fasta}
done
