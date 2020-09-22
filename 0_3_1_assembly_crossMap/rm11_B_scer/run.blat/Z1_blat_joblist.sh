#!/bin/bash
##$ -t $it
#$ -q abio,bio,pub8i,pub64,jje,jje128,free48,free64
#$ -ckpt blcr

export PATH="/data/users/xinwenz/software/kent:/data/users/xinwenz/software/kent/blat:$PATH"
export wd=`pwd`
csh -f `head -n $SGE_TASK_ID jobList | tail -n 1`
