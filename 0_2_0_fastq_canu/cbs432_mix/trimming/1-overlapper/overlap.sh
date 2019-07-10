#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/dfs1/bio/mchakrab/pacbio/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/dfs1/bio/mchakrab/pacbio/canu"
fi


#  Store must exist: trimming/cbs432.gkpStore

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
  opt="-h 1-45535 -r 1-45535 --hashstrings 45535 --hashdatalen 100005422"
fi

if [ $jobid -eq 2 ] ; then
  bat="001"
  job="001/000002"
  opt="-h 45536-136515 -r 1-136515 --hashstrings 90980 --hashdatalen 100000699"
fi

if [ $jobid -eq 3 ] ; then
  bat="001"
  job="001/000003"
  opt="-h 136516-221115 -r 1-221115 --hashstrings 84600 --hashdatalen 100002838"
fi

if [ $jobid -eq 4 ] ; then
  bat="001"
  job="001/000004"
  opt="-h 221116-307579 -r 1-307579 --hashstrings 86464 --hashdatalen 100003844"
fi

if [ $jobid -eq 5 ] ; then
  bat="001"
  job="001/000005"
  opt="-h 307580-604711 -r 1-604711 --hashstrings 297132 --hashdatalen 100007542"
fi

if [ $jobid -eq 6 ] ; then
  bat="001"
  job="001/000006"
  opt="-h 604712-633487 -r 1-633487 --hashstrings 28776 --hashdatalen 7485898"
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
  -G \
  -t 8 \
  -k 22 \
  -k ../0-mercounts/cbs432.ms22.frequentMers.fasta \
  --hashbits 23 \
  --hashload 0.75 \
  --maxerate  0.144 \
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
