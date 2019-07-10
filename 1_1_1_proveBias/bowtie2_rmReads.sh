#!/bin/bash
#$ -N bowtie2_rmReads
#$ -pe openmp 8-32

#module load tophat/2.1.0
#module load enthought_python/7.3.2
#module load samtools/1.3 
module load bowtie2/2.2.7 

#refs="a3 a3 a4 a4"
#exps="A3_ctl A3_nic A4_ctl A4_nic"

#ref=$(find -iname 'rm*.fasta' | sort | head -n $SGE_TASK_ID | tail -n 1)
#refbase=${ref%.fasta}
#outsam=${refbase}.sam

reads_rm="../short0hybrid/rm11_3m"


#bowtie2 -p $NSLOTS -k 20 -x $refbase -1 ${reads_rm}_r1.fastq -2 ${reads_rm}_r2.fastq > ${outsam}
bowtie2 -p $NSLOTS -k 20 -x oneRef/yps128_masked -1 ${reads_rm}_r1.fastq -2 ${reads_rm}_r2.fastq > oneRef/yps_masked_rmReads.sam
