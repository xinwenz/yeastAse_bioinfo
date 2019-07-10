#!/bin/bash
#$ -m beas

# not all queues work. abio, pub64,free64 works well with test, but not jje,bio,free88i
#lst="cbs432 yps128 rm11"
#f=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

prev="rm11_B"
nex="rm11_C"

~/software/racon/build/bin/racon ../fast50basecall/rm11.fastq ${prev}.sam ${prev}.fasta > ${nex}.fasta
