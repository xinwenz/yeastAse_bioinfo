#!/bin/bash 
#$ -pe openmp 32-64

module load smrtanalysis/2.3.0p5
module load samtools/1.3

#lst="cbs432 yps128"
#sta=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

prev="yps128_5"
nex="yps128_6"

samtools faidx ${prev}.fasta

#ln -s ../canu0finisher/$b/improved.fasta ${prev}.fasta

quiver -j $NSLOTS ${prev}.cmp.h5 -r ${prev}.fasta -o ${nex}.fasta
