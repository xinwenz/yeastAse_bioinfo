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


if [ ! -e ./cbs432.unitigs.aligned.gfa ] ; then
  $bin/alignGFA \
    -T ../cbs432.utgStore 2 \
    -i ./cbs432.unitigs.gfa \
    -o ./cbs432.unitigs.aligned.gfa \
    -t 4 \
  > ./cbs432.unitigs.aligned.gfa.err 2>&1
#  File is important: cbs432.unitigs.aligned.gfa
fi


if [ ! -e ./cbs432.contigs.aligned.gfa ] ; then
  $bin/alignGFA \
    -T ../cbs432.ctgStore 2 \
    -i ./cbs432.contigs.gfa \
    -o ./cbs432.contigs.aligned.gfa \
    -t 4 \
  > ./cbs432.contigs.aligned.gfa.err 2>&1
#  File is important: cbs432.contigs.aligned.gfa
fi


if [ ! -e ./cbs432.unitigs.aligned.bed ] ; then
  $bin/alignGFA -bed \
    -T ../cbs432.utgStore 2 \
    -C ../cbs432.ctgStore 2 \
    -i ./cbs432.unitigs.bed \
    -o ./cbs432.unitigs.aligned.bed \
    -t 4 \
  > ./cbs432.unitigs.aligned.bed.err 2>&1
#  File is important: cbs432.unitigs.aligned.bed
fi


if [ -e ./cbs432.unitigs.aligned.gfa -a \
     -e ./cbs432.contigs.aligned.gfa -a \
     -e ./cbs432.unitigs.aligned.bed ] ; then
  echo GFA alignments updated.
  exit 0
else
  echo GFA alignments failed.
  exit 1
fi
