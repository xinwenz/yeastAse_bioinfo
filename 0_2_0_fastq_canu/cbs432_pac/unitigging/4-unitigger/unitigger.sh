#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/data/apps/user_contributed_software/mchakrab/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/data/apps/user_contributed_software/mchakrab/canu"
fi



#  Store must exist: unitigging/cbs432.gkpStore
#  Store must exist: unitigging/cbs432.ovlStore

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

if [ -e ../cbs432.ctgStore/seqDB.v001.tig -a -e ../cbs432.utgStore/seqDB.v001.tig ] ; then
  exit 0
fi

$bin/bogart \
 -G ../cbs432.gkpStore \
 -O ../cbs432.ovlStore \
 -o ./cbs432 \
 -gs 12000000 \
 -eg 0.045 \
 -eM 0.045 \
 -mo 500 \
 -dg 6 \
 -db 6 \
 -dr 3 \
 -ca 2100 \
 -cp 200 \
 -threads 4 \
 -M 16 \
 -unassembled 2 0 1.0 0.5 3 \
 > ./unitigger.err 2>&1 \
&& \
mv ./cbs432.ctgStore ../cbs432.ctgStore \
&& \
mv ./cbs432.utgStore ../cbs432.utgStore

#  File is important: cbs432.unitigs.gfa
#  File is important: cbs432.contigs.gfa

#  File is important: seqDB.v001.dat
#  File is important: seqDB.v001.tig

#  File is important: seqDB.v001.dat
#  File is important: seqDB.v001.tig

$bin/tgStoreDump \
  -G ../cbs432.gkpStore \
  -T ../cbs432.ctgStore 1 \
  -sizes -s 12000000 \
> ../cbs432.ctgStore/seqDB.v001.sizes.txt
#  File is important: seqDB.v001.sizes.txt

exit 0
