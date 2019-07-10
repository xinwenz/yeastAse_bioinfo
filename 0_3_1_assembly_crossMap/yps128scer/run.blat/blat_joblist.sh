#!/bin/bash
#$ -t 1-357
#$ -q free64

export PATH="/data/users/xinwenz/software/kent:/data/users/xinwenz/software/kent/blat:$PATH"
export wd=`pwd`
csh -f `head -n $SGE_TASK_ID jobList | tail -n 1`
