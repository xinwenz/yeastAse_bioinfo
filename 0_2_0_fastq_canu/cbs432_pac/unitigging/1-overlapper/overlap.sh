#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/data/apps/user_contributed_software/mchakrab/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/data/apps/user_contributed_software/mchakrab/canu"
fi


#  Store must exist: unitigging/cbs432.gkpStore

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

if [ $jobid -eq 1 ] ; then
  bat="001"
  job="001/000001"
  opt="-h 1-85634 -r 1-85634 --hashstrings 10684 --hashdatalen 85315972"
fi

if [ $jobid -eq 2 ] ; then
  bat="001"
  job="001/000002"
  opt="-h 85635-158836 -r 1-158836 --hashstrings 9098 --hashdatalen 85315177"
fi

if [ $jobid -eq 3 ] ; then
  bat="001"
  job="001/000003"
  opt="-h 158837-232032 -r 1-232032 --hashstrings 9516 --hashdatalen 85318237"
fi

if [ $jobid -eq 4 ] ; then
  bat="001"
  job="001/000004"
  opt="-h 232033-304610 -r 1-304610 --hashstrings 9331 --hashdatalen 85321172"
fi

if [ $jobid -eq 5 ] ; then
  bat="001"
  job="001/000005"
  opt="-h 304611-572715 -r 1-572715 --hashstrings 11320 --hashdatalen 85318973"
fi

if [ $jobid -eq 6 ] ; then
  bat="001"
  job="001/000006"
  opt="-h 572716-621502 -r 1-621502 --hashstrings 1898 --hashdatalen 12218067"
fi


if [ ! -d ./$bat ]; then
  mkdir ./$bat
fi

if [ -e ./$job.ovb ]; then
  echo Job previously completed successfully.
  exit
fi

#  File must exist: cbs432.ms22.frequentMers.fasta

$bin/overlapInCore \
  -t 8 \
  -k 22 \
  -k ../0-mercounts/cbs432.ms22.frequentMers.fasta \
  --hashbits 23 \
  --hashload 0.75 \
  --maxerate  0.045 \
  --minlength 500 \
  $opt \
  -o ./$job.ovb.WORKING \
  -s ./$job.stats \
  ../cbs432.gkpStore \
&& \
mv ./$job.ovb.WORKING ./$job.ovb

#  File is important: $job.ovb
#  File is important: $job.counts
#  File is important: $job.stats

exit 0
