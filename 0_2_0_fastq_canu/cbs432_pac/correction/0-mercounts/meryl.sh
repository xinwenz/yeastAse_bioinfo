#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/data/apps/user_contributed_software/mchakrab/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/data/apps/user_contributed_software/mchakrab/canu"
fi


#  Store must exist: correction/cbs432.gkpStore

#  Purge any previous intermediate result.  Possibly not needed, but safer.

rm -f ./cbs432.ms16.WORKING*

$bin/meryl \
  -B -C -L 2 -v -m 16 -threads 4 -memory 6553 \
  -s ../cbs432.gkpStore \
  -o ./cbs432.ms16.WORKING \
&& \
mv ./cbs432.ms16.WORKING.mcdat ./cbs432.ms16.mcdat \
&& \
mv ./cbs432.ms16.WORKING.mcidx ./cbs432.ms16.mcidx

#  File is important: cbs432.ms16.mcdat

#  File is important: cbs432.ms16.mcidx


#  Dump a histogram

$bin/meryl \
  -Dh -s ./cbs432.ms16 \
>  ./cbs432.ms16.histogram.WORKING \
2> ./cbs432.ms16.histogram.info \
&& \
mv -f ./cbs432.ms16.histogram.WORKING ./cbs432.ms16.histogram

#  File is important: cbs432.ms16.histogram

#  File is important: cbs432.ms16.histogram.info


#  Compute a nice kmer threshold.

$bin/estimate-mer-threshold \
  -h ./cbs432.ms16.histogram \
  -c 238 \
>  ./cbs432.ms16.estMerThresh.out.WORKING \
2> ./cbs432.ms16.estMerThresh.err \
&& \
mv ./cbs432.ms16.estMerThresh.out.WORKING ./cbs432.ms16.estMerThresh.out

#  File is important: cbs432.ms16.estMerThresh.out

#  File is important: cbs432.ms16.estMerThresh.err


exit 0
