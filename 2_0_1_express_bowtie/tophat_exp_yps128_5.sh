#!/bin/bash
#$ -N tophat_exp_yps128_5
#$ -t 2
#$ -pe openmp 128 
#$ -q jje128

# rerun Jun15/18
module load samtools/1.8-11
module load bowtie2/2.2.7
module load tophat/2.1.0

ref=yps128_5

r1E=$(ls ../0express/deMx_trim_E/*_r1.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1) 
r1J=$(ls ../0express/deMx_trim_J/*_r1.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1)

r2E=${r1E%_r1.fq.gz}_r2.fq.gz
r2J=${r1J%_r1.fq.gz}_r2.fq.gz

lab=$(basename $r1E _r1.fq.gz)
outfolder=$ref/${lab:2:10}

tophat -p $NSLOTS --mate-inner-dist 225 --mate-std-dev 130 --prefilter-multihits --library-type fr-unstranded -o $outfolder $ref $r1E,$r1J $r2E,$r2J

mv $outfolder/accepted_hits.bam $ref/${labi:2:10}.bam
