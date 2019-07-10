#!/bin/bash
#$ -N findSNPcount
#$ -t 1-40


# index the fasta files before. mpieup tried to build one if it didn't find any. 


g=$SGE_TASK_ID

mapall=$(find ./bowtie2_*/  -name *[AH].bam | sort | head -n $g | tail -n 1)
mapfile=${mapall%.bam}
reftmp=$(echo $mapall | cut -f2 -d"/")
ref=${reftmp:8:10}
########################################################################################

# use samtools mpileup to get pileupfile 
module load samtools/1.9

samtools mpileup -q 5 -l ../1exp0map/5Bsnp/${ref}_snpls_u487 -f ../1cali0map/${ref}.fasta ${mapfile}.bam --output-QNAME --output-BP > ${mapfile}.pileup.BPNAME

# get pilecout 
#python2 ~/software/count_pileup.py ${mapfile}.pileup > ${mapfile}.pilecount

# .delta
#. snps
# .snpls
# .pileup
# .pilecount 
