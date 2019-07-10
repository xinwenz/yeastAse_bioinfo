#!/bin/bash
#$ -N canu_rm11fastq
#$ -ckpt restart 
#$ -pe openmp 32-64

PATH=$PATH:/dfs1/bio/mchakrab/pacbio/canu/Linux-amd64/bin/
export PATH

canu -p rm11 -d ./analysis/fastq_canu_output/rm11_oxford -s ./scripts/canu_spec genomeSize=12M -nanopore-raw /dfs1/bio/xinwenz/nnp/analysis/fastq_canu_output/rm11_yxz003.fastq 
