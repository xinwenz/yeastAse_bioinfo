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



#  File must exist: seqDB.v001.dat
#  File must exist: seqDB.v001.tig

#  File must exist: seqDB.v002.dat
#  File must exist: seqDB.v002.tig

#  File must exist: seqDB.v001.dat
#  File must exist: seqDB.v001.tig

#  File must exist: seqDB.v002.dat
#  File must exist: seqDB.v002.tig


if [ ! -e ./rm11.unitigs.aligned.gfa ] ; then
  $bin/alignGFA \
    -T ../rm11.utgStore 2 \
    -i ./rm11.unitigs.gfa \
    -o ./rm11.unitigs.aligned.gfa \
    -t 4 \
  > ./rm11.unitigs.aligned.gfa.err 2>&1
#  File is important: rm11.unitigs.aligned.gfa
fi


if [ ! -e ./rm11.contigs.aligned.gfa ] ; then
  $bin/alignGFA \
    -T ../rm11.ctgStore 2 \
    -i ./rm11.contigs.gfa \
    -o ./rm11.contigs.aligned.gfa \
    -t 4 \
  > ./rm11.contigs.aligned.gfa.err 2>&1
#  File is important: rm11.contigs.aligned.gfa
fi


if [ ! -e ./rm11.unitigs.aligned.bed ] ; then
  $bin/alignGFA -bed \
    -T ../rm11.utgStore 2 \
    -C ../rm11.ctgStore 2 \
    -i ./rm11.unitigs.bed \
    -o ./rm11.unitigs.aligned.bed \
    -t 4 \
  > ./rm11.unitigs.aligned.bed.err 2>&1
#  File is important: rm11.unitigs.aligned.bed
fi


if [ -e ./rm11.unitigs.aligned.gfa -a \
     -e ./rm11.contigs.aligned.gfa -a \
     -e ./rm11.unitigs.aligned.bed ] ; then
  echo GFA alignments updated.
  exit 0
else
  echo GFA alignments failed.
  exit 1
fi
