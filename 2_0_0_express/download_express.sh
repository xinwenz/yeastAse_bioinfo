#!/bin/bash
#$ -N download_express
#$ -t 1-16

lst="\
"http://slimsdata.genomecenter.ucdavis.edu/Data/2qn35cgn4q/Unaligned/Project_JEXZ_r115_run1/r115-run1_S1_R1_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/2qn35cgn4q/Unaligned/Project_JEXZ_r115_run1/r115-run1_S1_R2_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/2qn35cgn4q/Unaligned/Project_JEXZ_r115_run1/r115-run1_S1_R3_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/2qn35cgn4q/Unaligned/Project_JEXZ_r115_run1/r115-run1_S1_R4_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/rd2uxyze2/Unaligned/Project_JEXZ_r115_run2/r115-run2_S1_R1_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/rd2uxyze2/Unaligned/Project_JEXZ_r115_run2/r115-run2_S1_R2_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/rd2uxyze2/Unaligned/Project_JEXZ_r115_run2/r115-run2_S1_R3_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/rd2uxyze2/Unaligned/Project_JEXZ_r115_run2/r115-run2_S1_R4_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/gr7m35gmdm/Unaligned/Project_JEXZ_r1530_run1/r1530-run1_S1_R1_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/gr7m35gmdm/Unaligned/Project_JEXZ_r1530_run1/r1530-run1_S1_R2_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/gr7m35gmdm/Unaligned/Project_JEXZ_r1530_run1/r1530-run1_S1_R3_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/gr7m35gmdm/Unaligned/Project_JEXZ_r1530_run1/r1530-run1_S1_R4_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/dkk8uf7575/Unaligned/Project_JEXZ_r1530_run2/r1530-run2_S1_R1_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/dkk8uf7575/Unaligned/Project_JEXZ_r1530_run2/r1530-run2_S1_R2_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/dkk8uf7575/Unaligned/Project_JEXZ_r1530_run2/r1530-run2_S1_R3_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/dkk8uf7575/Unaligned/Project_JEXZ_r1530_run2/r1530-run2_S1_R4_001.fastq.gz" \
"
addr=$(echo $lst | cut -d" " -f$SGE_TASK_ID)
outf=$(basename $addr)
wget $addr -O $outf





# r115 run 1 (~600M)
# http://slimsdata.genomecenter.ucdavis.edu/Data/2qn35cgn4q/Unaligned/Project_JEXZ_r115_run1/r115-run1_S1_R1_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/2qn35cgn4q/Unaligned/Project_JEXZ_r115_run1/r115-run1_S1_R2_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/2qn35cgn4q/Unaligned/Project_JEXZ_r115_run1/r115-run1_S1_R3_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/2qn35cgn4q/Unaligned/Project_JEXZ_r115_run1/r115-run1_S1_R4_001.fastq.gz

# r115 run 2 (~600)
# http://slimsdata.genomecenter.ucdavis.edu/Data/rd2uxyze2/Unaligned/Project_JEXZ_r115_run2/r115-run2_S1_R1_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/rd2uxyze2/Unaligned/Project_JEXZ_r115_run2/r115-run2_S1_R2_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/rd2uxyze2/Unaligned/Project_JEXZ_r115_run2/r115-run2_S1_R3_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/rd2uxyze2/Unaligned/Project_JEXZ_r115_run2/r115-run2_S1_R4_001.fastq.gz

# r1530 run1 (~600M)
# http://slimsdata.genomecenter.ucdavis.edu/Data/gr7m35gmdm/Unaligned/Project_JEXZ_r1530_run1/r1530-run1_S1_R1_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/gr7m35gmdm/Unaligned/Project_JEXZ_r1530_run1/r1530-run1_S1_R2_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/gr7m35gmdm/Unaligned/Project_JEXZ_r1530_run1/r1530-run1_S1_R3_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/gr7m35gmdm/Unaligned/Project_JEXZ_r1530_run1/r1530-run1_S1_R4_001.fastq.gz

# r1530 run2 (~600M)
# http://slimsdata.genomecenter.ucdavis.edu/Data/dkk8uf7575/Unaligned/Project_JEXZ_r1530_run2/r1530-run2_S1_R1_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/dkk8uf7575/Unaligned/Project_JEXZ_r1530_run2/r1530-run2_S1_R2_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/dkk8uf7575/Unaligned/Project_JEXZ_r1530_run2/r1530-run2_S1_R3_001.fastq.gz
# http://slimsdata.genomecenter.ucdavis.edu/Data/dkk8uf7575/Unaligned/Project_JEXZ_r1530_run2/r1530-run2_S1_R4_001.fastq.gz