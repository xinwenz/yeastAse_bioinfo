#!/bin/bash
#$ -N findSNPcount

# this is for generate ref1's snp count 
ref1="yps128_oldref"
ref2="rm11_oldref"
mapp="yps128_oldref_hybrid"

module load MUMmer/3.23
module load samtools/1.3

prefx=${ref1:0:1}${ref2:0:1}
nucmer --mum -p ${prefx}_nucmer ${ref1}.fasta ${ref2}.fasta
show-snps -Clr ${prefx}_nucmer.delta > ${prefx}.snps

# from snps file to get snp list file 
python2 ../nucmer2bed.py ${prefx}.snps > ${ref1}.snpls

# use samtools mpileup to get pileupfile 
samtools mpileup -B -q 10 -l ${ref1}.snpls -f ${ref1}.fasta ${mapp}.bam > ${mapp}.pileup

# get pilecout 
python2 ../count_pileup.py ${mapp}.pileup > ${mapp}.pilecount


# .delta
#. snps
# .snpls
# .pileup
# .pilecount 
