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

if [ $jobid = 1 ] ; then
  minid=1
  maxid=144531
fi
if [ $jobid = 2 ] ; then
  minid=144532
  maxid=274907
fi
if [ $jobid = 3 ] ; then
  minid=274908
  maxid=621502
fi
jobid=`printf %05d $jobid`

if [ -e ./$jobid.red ] ; then
  echo Job previously completed successfully.
  exit
fi

$bin/findErrors \
  -G ../cbs432.gkpStore \
  -O ../cbs432.ovlStore \
  -R $minid $maxid \
  -e 0.045 -l 500 \
  -o ./$jobid.red.WORKING \
  -t 4 \
&& \
mv ./$jobid.red.WORKING ./$jobid.red

#  File is important: $jobid.red

