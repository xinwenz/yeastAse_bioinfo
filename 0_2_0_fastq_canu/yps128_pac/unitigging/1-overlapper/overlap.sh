#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/data/apps/user_contributed_software/mchakrab/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/data/apps/user_contributed_software/mchakrab/canu"
fi


#  Store must exist: unitigging/yps128.gkpStore

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
  opt="-h 1-98420 -r 1-98420 --hashstrings 9019 --hashdatalen 85314337"
fi

if [ $jobid -eq 2 ] ; then
  bat="001"
  job="001/000002"
  opt="-h 98421-186816 -r 1-186816 --hashstrings 9714 --hashdatalen 85312662"
fi

if [ $jobid -eq 3 ] ; then
  bat="001"
  job="001/000003"
  opt="-h 186817-270738 -r 1-270738 --hashstrings 9474 --hashdatalen 85315089"
fi

if [ $jobid -eq 4 ] ; then
  bat="001"
  job="001/000004"
  opt="-h 270739-350134 -r 1-350134 --hashstrings 9331 --hashdatalen 85325798"
fi

if [ $jobid -eq 5 ] ; then
  bat="001"
  job="001/000005"
  opt="-h 350135-544682 -r 1-544682 --hashstrings 9511 --hashdatalen 85315083"
fi

if [ $jobid -eq 6 ] ; then
  bat="001"
  job="001/000006"
  opt="-h 544683-593675 -r 1-593675 --hashstrings 3629 --hashdatalen 38052997"
fi


if [ ! -d ./$bat ]; then
  mkdir ./$bat
fi

if [ -e ./$job.ovb ]; then
  echo Job previously completed successfully.
  exit
fi

#  File must exist: yps128.ms22.frequentMers.fasta

$bin/overlapInCore \
  -t 8 \
  -k 22 \
  -k ../0-mercounts/yps128.ms22.frequentMers.fasta \
  --hashbits 23 \
  --hashload 0.75 \
  --maxerate  0.045 \
  --minlength 500 \
  $opt \
  -o ./$job.ovb.WORKING \
  -s ./$job.stats \
  ../yps128.gkpStore \
&& \
mv ./$job.ovb.WORKING ./$job.ovb

#  File is important: $job.ovb
#  File is important: $job.counts
#  File is important: $job.stats

exit 0
