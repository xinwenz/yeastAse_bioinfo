#!/bin/bash
#$ -N findSNPcount
#$ -t 1-40


# index the fasta files before. mpieup tried to build one if it didn't find any. 


g=$SGE_TASK_ID

mapall=$(find ./hst_*/  -name *[AH]_nosp.bam | sort | head -n $g | tail -n 1)
mapfile=${mapall%.bam}
reftmp=$(echo $mapall | cut -f2 -d"/")
ref=${reftmp:4:20}
########################################################################################

# use samtools mpileup to get pileupfile 
module load samtools/1.9

samtools mpileup -q 5 -l ./1_5Bsnp/${ref}_snpls_nofilter -f ./${ref}.fasta ${mapfile}.bam --output-QNAME --output-BP > ${mapfile}.pileup.BPNAME

# get pilecout 
#python2 ~/software/count_pileup.py ${mapfile}.pileup > ${mapfile}.pilecount

# .delta
#. snps
# .snpls
# .pileup
# .pilecount 
