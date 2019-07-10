#!/bin/bash
#$ -pe openmp 8 
#$ -q pub8i 

module load STAR/2.5.2a-static

STAR --runThreadN 8 --runMode genomeGenerate --genomeDir yps128_9_starIndex/ --genomeFastaFiles yps128_9.fa
