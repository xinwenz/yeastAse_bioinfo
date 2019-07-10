#!/bin/bash
#$ -N cat_fastq

cat bc{1758,2208}_*/workspace/pass/*.fastq > rm11.fastq
cat bc1834_*/workspace/pass/*.fastq > cbs432.fastq
cat bc{0012,0740,2218}_*/workspace/pass/*.fastq > yps128.fastq


