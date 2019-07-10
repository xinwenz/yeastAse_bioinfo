#!/bin/bash
#$ -N quiver_3
#$ -t 1-2 
#$ -pe openmp 32-64

module load smrtanalysis/2.3.0p5
module load samtools/1.3

lst="cbs432 yps128"
sta=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

prev=${sta}_3
nex=${sta}_4

ref=${prev}.fasta
samtools faidx ${ref}

#ln -s ../canu0finisher/$b/improved.fasta ${prev}.fasta

quiver -j $NSLOTS ${prev}.cmp.h5 -r $ref -o ${nex}.fasta
