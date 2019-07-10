#!/bin/bash 
#$ -N cat_fasta 
#$ -t 1-3 

lst='rm11,yps128,cbs432'
a=$(echo $lst | cut -d"," -f$SGE_TASK_ID)

cat ../a0fast50basecall/"$a".fasta ../a0h50dextract/"$a".fasta > "$a".fasta



