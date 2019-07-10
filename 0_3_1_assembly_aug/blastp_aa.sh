#!/bin/bash 
#$ -N blastp_aa 
#$ -q jje128

module load ytao7/ncbi-blast/2.7.1

blastp -max_target_seqs 1 -db yeast.aa -query yps128_5.aa -outfmt "6 qacc sacc evalue qstart qend sstart send" -remote -out yps128_5.blastp
