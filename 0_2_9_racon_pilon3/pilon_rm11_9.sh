#!/bin/bash
#$ -N pilon_rm11_9
#$ -pe openmp 8-64

module load jje/pilon
#version 1.16

prev="rm11_9"
nex="rm11_A"

pilon --genome ${prev}.fasta --frags ${prev}.bam --output ${nex} --threads $NSLOTS
