#!/bin/bash
#$ -t 1-30
#$ -pe openmp 64
#$ -q jje128,jje,epyc,bio,abio

# rerun jun15/18
module load STAR/2.5.2a-static

ref=yps128_5

r1=$(ls ../0express/deMx_fixed_zero/*_r1.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1) 
r2=$(ls ../0express/deMx_fixed_zero/*_r2.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1)

#--limitBAMsortRAM 5000000000 
label=$(basename $r1 _r1.fq.gz)

#STAR --limitBAMsortRAM 5000000000 --runThreadN 64 --genomeDir yps128_5_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_yps128_5/$label/ --outSAMtype BAM SortedByCoordinate

#STAR --limitBAMsortRAM 5000000000 --runThreadN 64 --genomeDir yps128_5_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_yps128_5/"$label"_revisePara/ --outSAMtype BAM SortedByCoordinate --alignIntronMin 10 --alignIntronMax 5000 --alignMatesGapMax 5000 --alignSJoverhangMin 15

#STAR --limitBAMsortRAM 5000000000 --runThreadN 64 --genomeDir yps128_5_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_yps128_5/"$label"_secPara/ --outSAMtype BAM SortedByCoordinate --alignIntronMin 10 --alignIntronMax 600 --alignMatesGapMax 900 --alignSJoverhangMin 20 --outFilterType BySJout

#STAR --limitBAMsortRAM 5000000000 --runThreadN 64 --genomeDir yps128_5_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_yps128_5/"$label"_3Para/ --outSAMtype BAM SortedByCoordinate --alignIntronMin 10 --alignIntronMax 600 --alignMatesGapMax 900 --alignSJoverhangMin 20 --outFilterType BySJout --scoreGap -16 --outFilterMultimapNmax 4
mkdir star_yps128_5/"$label"_last

STAR --limitBAMsortRAM 5000000000 --runThreadN 64 --genomeDir yps128_5_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_yps128_5/"$label"_last/ --outSAMtype BAM SortedByCoordinate --alignIntronMin 10 --alignIntronMax 600 --alignMatesGapMax 900 --alignSJoverhangMin 20 --outFilterType BySJout --scoreGap -36 --outFilterMultimapNmax 4

