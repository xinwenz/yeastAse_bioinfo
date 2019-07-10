#!/bin/bash
#$ -N deMl_D130

~/software/deML/src/deML -i D130_barcode.tsv -f D130_R1_trim.fastq.gz -r D130_R2_trim.fastq.gz -if1 D130_I1.fastq.gz -if2 D130_I2.fastq.gz -o deMx_trim/D -s deMx_trim/summary.txt
