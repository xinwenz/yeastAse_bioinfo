#!/bin/bash
#$ -N busco_rm13
PATH=$PATH:/dfs1/bio/mchakrab/pacbio/BUSCO_v1.22/
export PATH

module load blast
module load augustus
module load hmmer

BUSCO_v1.22.py -o rm13 -in ../b0fastq0canu/rm11_oxford/rm11.contigs.fasta -l /dfs1/bio/mchakrab/pacbio/BUSCO_v1.22/saccharomycetales -m genome
