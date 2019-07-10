#!/bin/bash
#$ -N pbalign_0
#$ -t 1-2 
#$ -pe openmp 8

module load smrtanalysis/2.3.0p5


f=$(ls *.fofn | head -n $SGE_TASK_ID | tail -n 1 )
b=$(basename $f _baxh5.fofn)

prev=${b}_0

ln -s ../canu0finisher/$b/improved.fasta ${prev}.fasta

pbalign --nproc 8 $f ${prev}.fasta ${prev}.cmp.h5 --forQuiver
