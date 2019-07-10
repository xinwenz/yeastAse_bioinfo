#!/bin/bash

module load samtools/1.9


mapall=$(find *_[5B] -name *.bam | sort | head -n 1 | tail -n 1)
mapfile=${mapall%.bam}
ref=$(echo $mapall | cut -f1 -d"/")
############################################### as I am already got the snpls 

# use samtools mpileup to get pileupfile 
#samtools mpileup -q 5 -l 5Bsnp/rm11_B.snpls -f rm11_B.fasta rm11_B/D_10_A.test.sam --output-QNAME --output-BP > rm11_B/D_10_A.pileup.testout

# 12/10/2018 redo with low MAPQ 5. 
samtools mpileup -q 5 -l 5Bsnp/${ref}_snpls_293 -f ${ref}.fasta ${mapfile}.bam --output-QNAME --output-BP> ${mapfile}.pileup.withBPNAME

# get pilecout 
#python2 ~/software/count_pileup.py ${mapfile}.pileup > ${mapfile}.pilecount

# .delta
#. snps
# .snpls
# .pileup
# .pilecount 
