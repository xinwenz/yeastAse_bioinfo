#!/bin/bash
#$ -N download_short
#$ -t 1-4
lst=""http://slimsdata.genomecenter.ucdavis.edu/Data/fd56enmgy/180104_M00384_0036_MS5703846-150V3/MiSeqAnalysis/Undetermined_S0_L001_I1_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/fd56enmgy/180104_M00384_0036_MS5703846-150V3/MiSeqAnalysis/Undetermined_S0_L001_I2_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/fd56enmgy/180104_M00384_0036_MS5703846-150V3/MiSeqAnalysis/Undetermined_S0_L001_R1_001.fastq.gz" \
"http://slimsdata.genomecenter.ucdavis.edu/Data/fd56enmgy/180104_M00384_0036_MS5703846-150V3/MiSeqAnalysis/Undetermined_S0_L001_R2_001.fastq.gz""

addr=$(echo $lst | cut -d" " -f$SGE_TASK_ID)
outf=$(basename $addr)
wget $addr -O $outf
