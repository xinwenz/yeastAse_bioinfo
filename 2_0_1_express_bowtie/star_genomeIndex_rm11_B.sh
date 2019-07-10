#!/bin/bash
#$ -N star_genomeIndex_rm11_B
#$ -pe openmp 8 
#$ -q pub8i 

module load STAR/2.5.2a-static

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir rm11_B_starIndex/ --genomeFastaFiles rm11_B.fa
