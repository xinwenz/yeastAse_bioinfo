#!/bin/bash
#$ -t 1-60
#$ -q jje128,bigmemory,epyc,pub8i,free64,pub64,jje,abio,bio

# index the fasta files before. mpieup tried to build one if it didn't find any. 


g=$SGE_TASK_ID

bamfile=$(find star_*[F9]  -name *.bam | sort | head -n $g | tail -n 1)
res_folder=$(echo $bamfile | cut -f1 -d"/")
res_lab=$(echo $bamfile | cut -f2 -d"/")
ref=${res_folder:5:20}
########################################################################################

# use samtools mpileup to get pileupfile 
module load samtools

samtools mpileup -q 10 -l 9Fsnp/${ref}.snpls -f ${ref}.fa ${bamfile} > ${res_folder}/${res_lab}.pileup

#samtools mpileup -q 10  -f ${ref}.fa ${mapfile}.bam > ${mapfile}_whole.pileup

# get pilecout 
python2 ~/software/count_pileup.py ${res_folder}/${res_lab}.pileup >  ${res_folder}/${res_lab}.pilecount

# .delta
#. snps
# .snpls
# .pileup
# .pilecount 
