#!/bin/bash
#$ -q bigmemory

ref1="yps128_9"
ref2="rm11_F"

module load MUMmer/3.23
module load samtools

prefx=${ref1}_${ref2}
nucmer --mum -p ${prefx}_nucmer ../${ref1}.fasta ../${ref2}.fasta
show-snps -Clr ${prefx}_nucmer.delta > ${prefx}.snps

python2 ~/software/nucmer2bed.py ${prefx}.snps 
mv ref1.snpls ${ref1}.snpls
mv ref2.snpls ${ref2}.snpls

python2 ~/software/nucmer2coPosit.py ${prefx}.snps >yr9F.posmap

