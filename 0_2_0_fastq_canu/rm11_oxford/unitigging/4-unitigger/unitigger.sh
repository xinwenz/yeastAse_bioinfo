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



#  Store must exist: unitigging/rm11.gkpStore
#  Store must exist: unitigging/rm11.ovlStore

#  File must exist: evalues

#  Discover the job ID to run, from either a grid environment variable and a
#  command line offset, or directly from the command line.
#
if [ x$CANU_LOCAL_JOB_ID = x -o x$CANU_LOCAL_JOB_ID = xundefined -o x$CANU_LOCAL_JOB_ID = x0 ]; then
  baseid=$1
  offset=0
else
  baseid=$CANU_LOCAL_JOB_ID
  offset=$1
fi
if [ x$offset = x ]; then
  offset=0
fi
if [ x$baseid = x ]; then
  echo Error: I need CANU_LOCAL_JOB_ID set, or a job index on the command line.
  exit
fi
jobid=`expr $baseid + $offset`
if [ x$CANU_LOCAL_JOB_ID = x ]; then
  echo Running job $jobid based on command line options.
else
  echo Running job $jobid based on CANU_LOCAL_JOB_ID=$CANU_LOCAL_JOB_ID and offset=$offset.
fi

if [ -e ../rm11.ctgStore/seqDB.v001.tig -a -e ../rm11.utgStore/seqDB.v001.tig ] ; then
  exit 0
fi

$bin/bogart \
 -G ../rm11.gkpStore \
 -O ../rm11.ovlStore \
 -o ./rm11 \
 -gs 12000000 \
 -eg 0.144 \
 -eM 0.144 \
 -mo 500 \
 -dg 6 \
 -db 6 \
 -dr 3 \
 -ca 2100 \
 -cp 200 \
 -threads 4 \
 -M 16 \
 -unassembled 2 0 1.0 0.5 5 \
 > ./unitigger.err 2>&1 \
&& \
mv ./rm11.ctgStore ../rm11.ctgStore \
&& \
mv ./rm11.utgStore ../rm11.utgStore

#  File is important: rm11.unitigs.gfa
#  File is important: rm11.contigs.gfa

#  File is important: seqDB.v001.dat
#  File is important: seqDB.v001.tig

#  File is important: seqDB.v001.dat
#  File is important: seqDB.v001.tig

$bin/tgStoreDump \
  -G ../rm11.gkpStore \
  -T ../rm11.ctgStore 1 \
  -sizes -s 12000000 \
> ../rm11.ctgStore/seqDB.v001.sizes.txt
#  File is important: seqDB.v001.sizes.txt

exit 0
