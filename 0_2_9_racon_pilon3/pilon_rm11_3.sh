#!/bin/bash
#$ -N pilon_rm11_3 
#$ -pe openmp 8-64

module load jje/pilon
#version 1.16

prev="rm11_3"
nex="rm11_4"

pilon --genome ${prev}.fasta --frags ${prev}.bam --output ${nex}.fasta --threads $NSLOTS
