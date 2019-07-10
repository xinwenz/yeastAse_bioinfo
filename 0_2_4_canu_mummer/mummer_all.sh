#!/bin/bash
#$ -N mummer_all
#$ -t 1-3

module load perl/5.16.2
module load MUMmer 

lst='rm11 cbs432 yps128'
strain=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

nucmer -p "$strain"_nuc /dfs1/bio/xinwenz/refGen/scer_R64_all.fa ../fastq0canu/"$strain"_contigs_clean.fa
