#!/bin/bash
#$ -N finisher_all
#$ -pe openmp 48-72 

#module load MUMmer
# this prgrom generate tmp fils with same name, so not job arrary! 

module load perl/5.16.2
module load python/2.7.10
#lst='cbs432 rm11 yps128'
lst='yps128'
#dir=$(echo $lst | cut -d" " -f3)

for dir in $lst
do 
python /dfs1/bio/mchakrab/pacbio/finishingTool/finisherSC.py -par $NSLOTS -l True $dir /data/apps/MUMmer/3.23/
rm contigs*
rm improved*
rm noEmbed*
rm raw_reads.*
done
