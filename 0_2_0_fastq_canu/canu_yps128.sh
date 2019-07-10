#!/bin/bash
#$ -N canu_yps128
#$ -ckpt restart
#$ -pe openmp 48-128

#PATH=$PATH:/dfs1/bio/mchakrab/pacbio/canu/Linux-amd64/bin/
#export PATH
module load mchakrab/canu/1.6

canu -p yps128 -d yps128_pac -s canu_spec genomeSize=12M -pacbio-raw /dfs1/bio/xinwenz/nnp/h50dextract/yps128.fastq 
