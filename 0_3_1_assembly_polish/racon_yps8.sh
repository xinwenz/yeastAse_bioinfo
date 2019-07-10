#!/bin/bash

# not all queues work. abio, pub64,free64 works well with test, but not jje,bio,free88i
#lst="cbs432 yps128 rm11"
#f=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

prev="yps128_8"
nex="yps128_92"

# run again with the 1.3.1 version of racon
~/software/racon/build/bin/racon ../0short/yps128_r12_forRacon.fastq ${prev}.sam ${prev}.fasta > ${nex}.fasta
