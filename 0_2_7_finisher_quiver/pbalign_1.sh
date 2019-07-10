#!/bin/bash
#$ -N pbalign_1
#$ -t 1-2 
#$ -pe openmp 32-64

module load smrtanalysis/2.3.0p5


f=$(ls *.fofn | head -n $SGE_TASK_ID | tail -n 1 )
b=$(basename $f _baxh5.fofn)

prev=${b}_1

#ln -s ../canu0finisher/$b/improved.fasta ${prev}.fasta

pbalign --nproc $NSLOTS $f ${prev}.fasta ${prev}.cmp.h5 --forQuiver
