#!/bin/bash
#$ -pe openmp 8-64

module load smrtanalysis/2.3.0p5


#f=$(ls *.fofn | head -n $SGE_TASK_ID | tail -n 1 )
#b=$(basename $f _baxh5.fofn)

prev="yps128_5"

#ln -s ../canu0finisher/$b/improved.fasta ${prev}.fasta

pbalign --nproc $NSLOTS yps128_baxh5.fofn ${prev}.fasta ${prev}.cmp.h5 --forQuiver
