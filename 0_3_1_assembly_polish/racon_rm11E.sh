#!/bin/bash

# not all queues work. abio, pub64,free64 works well with test, but not jje,bio,free88i
#lst="cbs432 yps128 rm11"
#f=$(echo $lst | cut -d" " -f$SGE_TASK_ID)

prev="rm11_E"
nex="rm11_F2"

# racon version first run was rm11_F is 1.0.2 
# second run is rm11_F 1.3.1 

~/software/racon/build/bin/racon ../0short/rm11_r12_forRacon.fastq ${prev}.sam ${prev}.fasta > ${nex}.fasta
