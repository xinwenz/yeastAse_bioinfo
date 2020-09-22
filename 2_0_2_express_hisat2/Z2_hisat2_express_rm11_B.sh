#!/bin/bash
#$ -t 1-20
#$ -pe openmp 16-32
#$ -ckpt restart
#$ -q bio,jje128,jje,pub64,free64,abio,abio128

module load samtools/1.3
module load hisat2/2.1.0

ref=rm11_B
r1=$(ls ../2_0_1/deMx_fiexd_zero/*_[AH]_r1.fq.gz | sort | head -n $SGE_TASK_ID | tail -n 1)
r2=${r1%_r1.fq.gz}_r2.fq.gz
out=hst_rm11_B/$(basename $r1 _r1.fq.gz).bam

hisat2 -x $ref -1 $r1 -2 $r2 -p $NSLOTS -k 20 --no-spliced-alignment | samtools sort --threads $NSLOTS -T r_$SGE_TASK_ID > ${out}
