#!/bin/bash/
#$ -N busco_ypscbs
#$ -t 1-2


PATH=$PATH:/dfs1/bio/mchakrab/pacbio/BUSCO_v1.22/
export PATH

module load blast
module load augustus
module load hmmer

if [ $SGE_TASK_ID -eq 1 ]
then
BUSCO_v1.22.py -o yps128 -in ../b0fastq0canu/yps128_mix/yps128.contigs.fasta -l saccharomycetales_odb9 -m genome
else
BUSCO_v1.22.py -o cbs432 -in ../b0fastq0canu/cbs432_mix/cbs432.contigs.fasta -l saccharomycetales_odb9 -m genome
fi
