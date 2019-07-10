#!/bin/bash

module load R 
a=$(echo yr_20_exp {1..40})
Rscript true95_hpc.R $a
