#!/bin/bash/
#$ -t 1-2


PATH=$PATH:/dfs1/bio/mchakrab/pacbio/BUSCO_v1.22/
export PATH

module load perl/5.16.2
module load blast
module load augustus
module load hmmer

f=$(ls *.fasta | sort | head -n $SGE_TASK_ID | tail -n 1)
b=$(basename $f .fasta)

BUSCO_v1.22.py -o $b -in $f -l /dfs1/bio/mchakrab/pacbio/BUSCO_v1.22/fungi -m genome
