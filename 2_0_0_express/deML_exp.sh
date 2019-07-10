#!/bin/bash

#case $SGE_TASK_ID in 
#"1") 
~/software/deML/src/deML -i exp_barcode_115.tsv -f r115_run1_R1_trim.fastq.gz -r r115_run1_R2_trim.fastq.gz -if1 r115_run1_I1.fastq.gz -if2 r115_run1_I2.fastq.gz -o deMx_trim_E115/E -s deMx_trim_E115/E_summary.txt
#;;
#"2")
#~/software/deML/src/deML -i exp_barcode_530.tsv -f r1530_run1_R1_trim.fastq.gz -r r1530_run1_R2_trim.fastq.gz -if1 r1530_run1_I1.fastq.gz -if2 r1530_run1_I2.fastq.gz -o deMx_trim_E530/E -s deMx_trim_E530/E_summary.txt
#;;
#"3")
#~/software/deML/src/deML -i exp_barcode_115.tsv -f r115_run2_R1_trim.fastq.gz -r r115_run2_R2_trim.fastq.gz -if1 r115_run2_I1.fastq.gz -if2 r115_run2_I2.fastq.gz -o deMx_trim_J115/J -s deMx_trim_J115/J_summary.txt
#;;
#"4")
#~/software/deML/src/deML -i exp_barcode_530.tsv -f r1530_run2_R1_trim.fastq.gz -r r1530_run2_R2_trim.fastq.gz -if1 r1530_run2_I1.fastq.gz -if2 r1530_run2_I2.fastq.gz -o deMx_trim_J530/J -s deMx_trim_J530/J_summary.txt
#;;
#esac
