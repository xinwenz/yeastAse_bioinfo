#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/data/apps/user_contributed_software/mchakrab/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/data/apps/user_contributed_software/mchakrab/canu"
fi


#  Store must exist: correction/yps128.gkpStore

#  Purge any previous intermediate result.  Possibly not needed, but safer.

rm -f ./yps128.ms16.WORKING*

$bin/meryl \
  -B -C -L 2 -v -m 16 -threads 4 -memory 6553 \
  -s ../yps128.gkpStore \
  -o ./yps128.ms16.WORKING \
&& \
mv ./yps128.ms16.WORKING.mcdat ./yps128.ms16.mcdat \
&& \
mv ./yps128.ms16.WORKING.mcidx ./yps128.ms16.mcidx

#  File is important: yps128.ms16.mcdat

#  File is important: yps128.ms16.mcidx


#  Dump a histogram

$bin/meryl \
  -Dh -s ./yps128.ms16 \
>  ./yps128.ms16.histogram.WORKING \
2> ./yps128.ms16.histogram.info \
&& \
mv -f ./yps128.ms16.histogram.WORKING ./yps128.ms16.histogram

#  File is important: yps128.ms16.histogram

#  File is important: yps128.ms16.histogram.info


#  Compute a nice kmer threshold.

$bin/estimate-mer-threshold \
  -h ./yps128.ms16.histogram \
  -c 226 \
>  ./yps128.ms16.estMerThresh.out.WORKING \
2> ./yps128.ms16.estMerThresh.err \
&& \
mv ./yps128.ms16.estMerThresh.out.WORKING ./yps128.ms16.estMerThresh.out

#  File is important: yps128.ms16.estMerThresh.out

#  File is important: yps128.ms16.estMerThresh.err


exit 0
