#!/bin/bash
#$ -t 1-30
#$ -pe openmp 32-64
#$ -q jje128,jje,bigmemory,epyc,bio,pub64

# rerun jun15/18
module load STAR/2.5.2a-static

ref=rm11_F

r1=$(ls ../0express/deMx_fixed_zero/*_r1.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1) 
r2=$(ls ../0express/deMx_fixed_zero/*_r2.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1)

label=$(basename $r1 _r1.fq.gz)

#STAR --limitBAMsortRAM 5000000000 --runThreadN 128 --genomeDir rm11_B_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_rm11_B/$label/ --outSAMtype BAM SortedByCoordinate

#STAR --limitBAMsortRAM 5000000000 --runThreadN 64 --genomeDir rm11_B_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_rm11_B/"$label"_revisePara/ --outSAMtype BAM SortedByCoordinate --alignIntronMin 10 --alignIntronMax 5000 --alignMatesGapMax 5000 --alignSJoverhangMin 15

#STAR --limitBAMsortRAM 5000000000 --runThreadN 64 --genomeDir rm11_B_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_rm11_B/"$label"_secPara/ --outSAMtype BAM SortedByCoordinate --alignIntronMin 10 --alignIntronMax 600 --alignMatesGapMax 900 --alignSJoverhangMin 20 --outFilterType BySJout

#STAR --limitBAMsortRAM 5000000000 --runThreadN 64 --genomeDir rm11_B_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_rm11_B/"$label"_3Para/ --outSAMtype BAM SortedByCoordinate --alignIntronMin 10 --alignIntronMax 600 --alignMatesGapMax 900 --alignSJoverhangMin 20 --outFilterType BySJout --scoreGap -16 --outFilterMultimapNmax 4

mkdir star_${ref}/${label}

STAR --limitBAMsortRAM 5000000000 --runThreadN $NSLOTS --genomeDir ${ref}_starIndex --readFilesIn $r1 $r2 --readFilesCommand zcat --outFileNamePrefix star_${ref}/${label}/ --outSAMtype BAM SortedByCoordinate --alignIntronMin 10 --alignIntronMax 600 --alignMatesGapMax 900 --alignSJoverhangMin 20 --outFilterType BySJout --scoreGap -36 --outFilterMultimapNmax 4


