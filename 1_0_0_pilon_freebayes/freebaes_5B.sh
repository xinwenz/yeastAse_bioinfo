#!/bin/bash
#$ -t 1-2
#$ -ckpt restart

lst='rm11_B yps128_5'
fl=$(echo $lst | cut -d" " -f$SGE_TASK_ID )

~/software/freebayes/bin/freebayes -C 2 -0 -O -q 20 -z 0.10 -E 0 -X -u --ploidy 1 -F 0.75 -f ${fl}.fasta ${fl}_nodup.bam > ${fl}.vcf
