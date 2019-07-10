#!/bin/bash
#$ -pe openmp 16-128

module load smrtanalysis/2.3.0p5
module load samtools

#f=$(ls *.fofn | head -n $SGE_TASK_ID | tail -n 1 )
#b=$(basename $f _baxh5.fofn)

prev="yps128_6"
nex="yps128_7"

#ln -s ../canu0finisher/$b/improved.fasta ${prev}.fasta

pbalign --nproc $NSLOTS yps128_baxh5.fofn ${prev}.fasta ${prev}.cmp.h5 --forQuiver

samtools faidx ${prev}.fasta

quiver -j $NSLOTS ${prev}.cmp.h5 -r ${prev}.fasta -o ${nex}.fasta
