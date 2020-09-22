#!/bin/bash 
#$ -q free64
#$ -t 1-323

export PATH="/data/users/xinwenz/software/kent:$PATH"
csh -f `head -n $SGE_TASK_ID jobList | tail -n 1 `
