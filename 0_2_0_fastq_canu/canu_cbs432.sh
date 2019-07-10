#!/bin/bash
#$ -N canu_cbs432
#$ -ckpt blcr
#$ -pe openmp 48-128

#PATH=$PATH:/dfs1/bio/mchakrab/pacbio/canu/Linux-amd64/bin/
#export PATH

#canu -p cbs432 -d cbs432_pac -s canu_spec genomeSize=12M -nanopore-raw /dfs1/bio/xinwenz/nnp/a0fast50basecall/cbs432.fastq -pacbio-raw /dfs1/bio/xinwenz/nnp/a0h50dextract/cbs432.fastq 
module load mchakrab/canu/1.6
canu -p cbs432 -d cbs432_pac -s canu_spec genomeSize=12M -pacbio-raw /dfs1/bio/xinwenz/nnp/h50dextract/cbs432.fastq 
