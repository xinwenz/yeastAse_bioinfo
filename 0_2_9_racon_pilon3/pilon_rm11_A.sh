#!/bin/bash
#$ -N pilon_rm11_A
#$ -pe openmp 8-64

module load jje/pilon
#version 1.16

prev="rm11_A"
nex="rm11_B"

pilon --genome ${prev}.fasta --frags ${prev}.bam --output ${nex} --threads $NSLOTS
