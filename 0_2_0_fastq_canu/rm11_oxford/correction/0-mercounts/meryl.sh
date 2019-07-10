#!/bin/bash

syst=`uname -s`
arch=`uname -m`
name=`uname -n`

if [ "$arch" = "x86_64" ] ; then
  arch="amd64"
fi
if [ "$arch" = "Power Macintosh" ] ; then
  arch="ppc"
fi

bin="/dfs1/bio/mchakrab/pacbio/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/dfs1/bio/mchakrab/pacbio/canu"
fi


#  Store must exist: correction/rm11.gkpStore

#  Purge any previous intermediate result.  Possibly not needed, but safer.

rm -f ./rm11.ms16.WORKING*

$bin/meryl \
  -B -C -L 2 -v -m 16 -threads 4 -memory 6553 \
  -s ../rm11.gkpStore \
  -o ./rm11.ms16.WORKING \
&& \
mv ./rm11.ms16.WORKING.mcdat ./rm11.ms16.mcdat \
&& \
mv ./rm11.ms16.WORKING.mcidx ./rm11.ms16.mcidx

#  File is important: rm11.ms16.mcdat

#  File is important: rm11.ms16.mcidx


#  Dump a histogram

$bin/meryl \
  -Dh -s ./rm11.ms16 \
>  ./rm11.ms16.histogram.WORKING \
2> ./rm11.ms16.histogram.info \
&& \
mv -f ./rm11.ms16.histogram.WORKING ./rm11.ms16.histogram

#  File is important: rm11.ms16.histogram

#  File is important: rm11.ms16.histogram.info


#  Compute a nice kmer threshold.

$bin/estimate-mer-threshold \
  -h ./rm11.ms16.histogram \
  -c 59 \
>  ./rm11.ms16.estMerThresh.out.WORKING \
2> ./rm11.ms16.estMerThresh.err \
&& \
mv ./rm11.ms16.estMerThresh.out.WORKING ./rm11.ms16.estMerThresh.out

#  File is important: rm11.ms16.estMerThresh.out

#  File is important: rm11.ms16.estMerThresh.err


exit 0
