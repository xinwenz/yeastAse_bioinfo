#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/dfs1/bio/mchakrab/pacbio/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/dfs1/bio/mchakrab/pacbio/canu"
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
  opt="-h 1-48786 -r 1-48786 --hashstrings 48786 --hashdatalen 100001127"
fi

if [ $jobid -eq 2 ] ; then
  bat="001"
  job="001/000002"
  opt="-h 48787-144850 -r 1-144850 --hashstrings 96064 --hashdatalen 100002377"
fi

if [ $jobid -eq 3 ] ; then
  bat="001"
  job="001/000003"
  opt="-h 144851-234182 -r 1-234182 --hashstrings 89332 --hashdatalen 100017010"
fi

if [ $jobid -eq 4 ] ; then
  bat="001"
  job="001/000004"
  opt="-h 234183-330673 -r 1-330673 --hashstrings 96491 --hashdatalen 100000633"
fi

if [ $jobid -eq 5 ] ; then
  bat="001"
  job="001/000005"
  opt="-h 330674-633487 -r 1-633487 --hashstrings 302814 --hashdatalen 79246419"
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
