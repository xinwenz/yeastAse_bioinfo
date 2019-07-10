#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/data/apps/user_contributed_software/mchakrab/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/data/apps/user_contributed_software/mchakrab/canu"
fi



#  File must exist: seqDB.v001.dat
#  File must exist: seqDB.v001.tig

#  File must exist: seqDB.v002.dat
#  File must exist: seqDB.v002.tig

#  File must exist: seqDB.v001.dat
#  File must exist: seqDB.v001.tig

#  File must exist: seqDB.v002.dat
#  File must exist: seqDB.v002.tig


if [ ! -e ./yps128.unitigs.aligned.gfa ] ; then
  $bin/alignGFA \
    -T ../yps128.utgStore 2 \
    -i ./yps128.unitigs.gfa \
    -o ./yps128.unitigs.aligned.gfa \
    -t 4 \
  > ./yps128.unitigs.aligned.gfa.err 2>&1
#  File is important: yps128.unitigs.aligned.gfa
fi


if [ ! -e ./yps128.contigs.aligned.gfa ] ; then
  $bin/alignGFA \
    -T ../yps128.ctgStore 2 \
    -i ./yps128.contigs.gfa \
    -o ./yps128.contigs.aligned.gfa \
    -t 4 \
  > ./yps128.contigs.aligned.gfa.err 2>&1
#  File is important: yps128.contigs.aligned.gfa
fi


if [ ! -e ./yps128.unitigs.aligned.bed ] ; then
  $bin/alignGFA -bed \
    -T ../yps128.utgStore 2 \
    -C ../yps128.ctgStore 2 \
    -i ./yps128.unitigs.bed \
    -o ./yps128.unitigs.aligned.bed \
    -t 4 \
  > ./yps128.unitigs.aligned.bed.err 2>&1
#  File is important: yps128.unitigs.aligned.bed
fi


if [ -e ./yps128.unitigs.aligned.gfa -a \
     -e ./yps128.contigs.aligned.gfa -a \
     -e ./yps128.unitigs.aligned.bed ] ; then
  echo GFA alignments updated.
  exit 0
else
  echo GFA alignments failed.
  exit 1
fi
