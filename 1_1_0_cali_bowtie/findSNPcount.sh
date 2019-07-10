#!/bin/bash
#$ -t 1-40

module load samtools/1.9
g=$SGE_TASK_ID

#if [ $g -le 30 ]
#then
#	ref="rm11_B"
#elif [ $g -le 60 ]
#then
#	ref="yps128_5"
#elif [ $g -le 90 ]
#then	
#	ref="rm11_old"
#else
#	ref="yps1M ôf28_old"
#fi

mapall=$(find *_[5B] -name *[AH].bam | sort | head -n $g | tail -n 1)
mapfile=${mapall%.bam}
ref=$(echo $mapall | cut -f1 -d"/")
############################################### as I am already got the snpls 

# use samtools mpileup to get pileupfile 
#samtools mpileup -q 10 -l 9Fsnp/${ref}.snpls -f ${ref}.fasta ${mapfile}.bam > ${mapfile}.pileup

# 12/10/2018 redo with low MAPQ 5. Jan.10  
samtools mpileup -q 5 -l 5Bsnp/${ref}_snpls_u293 -f ${ref}.fasta ${mapfile}.bam --output-QNAME --output-BP > ${mapfile}.pileup.BPNAME

# get pilecout 
#python2 ~/software/count_pileup.py ${mapfile}.pileup > ${mapfile}.pilecount

# .delta
#. snps
# .snpls
# .pileup
# .pilecount 
