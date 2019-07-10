#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/dfs1/bio/mchakrab/pacbio/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/dfs1/bio/mchakrab/pacbio/canu"
fi


#  Store must exist: trimming/cbs432.gkpStore

#  Purge any previous intermediate result.  Possibly not needed, but safer.

rm -f ./cbs432.ms22.WORKING*

$bin/meryl \
  -B -C -L 2 -v -m 22 -threads 4 -memory 6553 \
  -s ../cbs432.gkpStore \
  -o ./cbs432.ms22.WORKING \
&& \
mv ./cbs432.ms22.WORKING.mcdat ./cbs432.ms22.mcdat \
&& \
mv ./cbs432.ms22.WORKING.mcidx ./cbs432.ms22.mcidx

#  File is important: cbs432.ms22.mcdat

#  File is important: cbs432.ms22.mcidx


#  Dump a histogram

$bin/meryl \
  -Dh -s ./cbs432.ms22 \
>  ./cbs432.ms22.histogram.WORKING \
2> ./cbs432.ms22.histogram.info \
&& \
mv -f ./cbs432.ms22.histogram.WORKING ./cbs432.ms22.histogram

#  File is important: cbs432.ms22.histogram

#  File is important: cbs432.ms22.histogram.info


#  Compute a nice kmer threshold.

$bin/estimate-mer-threshold \
  -h ./cbs432.ms22.histogram \
  -c 42 \
>  ./cbs432.ms22.estMerThresh.out.WORKING \
2> ./cbs432.ms22.estMerThresh.err \
&& \
mv ./cbs432.ms22.estMerThresh.out.WORKING ./cbs432.ms22.estMerThresh.out

#  File is important: cbs432.ms22.estMerThresh.out

#  File is important: cbs432.ms22.estMerThresh.err


exit 0
