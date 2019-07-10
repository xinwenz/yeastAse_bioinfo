#!/bin/bash
#$ -t 1-40
#$ -ckpt restart

module load samtools/1.9
g=$SGE_TASK_ID
mapall=$(find bam_*_[5B] -name *[AH].bam | sort | head -n $g | tail -n 1)
tmp=$(echo $mapall | cut -f1 -d"/")
ref=${tmp#bam_}
tmp2=$(echo $mapall | cut -f2 -d"/")
expl=${tmp2%.bam}

############################################### as I am already got the snpls 

# use samtools mpileup to get pileupfile 
#samtools mpileup -q 10 -l 9Fsnp/${ref}.snpls -f ${ref}.fasta ${mapfile}.bam > ${mapfile}.pileup

# 12/10/2018 redo with low MAPQ 5. Jan.10  
samtools mpileup -q 30 -l 3_5Bsnp/${ref}_snpls_evd -f genoms/${ref}.fasta ${mapall} --output-QNAME --output-BP > 3_5Bsnp_${ref}/${expl}.pileup.BPNAME

# get group name inserted into .pileup.BPNMAE
#python2 ~/software/count_pileup.py ${mapfile}.pileup > ${mapfile}.pilecount

# .delta
#. snps
# .snpls
# .pileup
# .pilecount 
