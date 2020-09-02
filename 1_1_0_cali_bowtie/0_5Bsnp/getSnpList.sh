#!/bin/bash

ref1="yps128_5"
ref2="rm11_B"

module load MUMmer/3.23

prefx=${ref1}_${ref2}
nucmer --mum -p ${prefx}_nucmer /dfs3/bio/xinwenz/nnp/1_1_0_cali_bowtie/genoms/${ref1}.fasta /dfs3/bio/xinwenz/nnp/1_1_0_cali_bowtie/genoms/${ref2}.fasta

show-snps -Clr ${prefx}_nucmer.delta > ${prefx}.snps
#python2 ~/software/nucmer2bed.py ${prefx}.snps 
#mv ref1.snpls ${ref1}.snpls
#mv ref2.snpls ${ref2}.snpls
python2 ~/software/nucmer2coPosit.py ${prefx}.snps >yr5B.posmap


prefx=${ref2}_${ref1}
nucmer --mum -p ${prefx}_nucmer /dfs3/bio/xinwenz/nnp/1_1_0_cali_bowtie/genoms/${ref2}.fasta /dfs3/bio/xinwenz/nnp/1_1_0_cali_bowtie/genoms/${ref1}.fasta

show-snps -Clr ${prefx}_nucmer.delta > ${prefx}.snps
python2 ~/software/nucmer2coPosit.py ${prefx}.snps > ryB5.posmap
