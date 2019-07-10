#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/dfs1/bio/mchakrab/pacbio/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/dfs1/bio/mchakrab/pacbio/canu"
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
  opt="-h 1-107050 -r 1-107050 --hashstrings 107050 --hashdatalen 100007434"
fi

if [ $jobid -eq 2 ] ; then
  bat="001"
  job="001/000002"
  opt="-h 107051-207266 -r 1-207266 --hashstrings 100216 --hashdatalen 100008055"
fi

if [ $jobid -eq 3 ] ; then
  bat="001"
  job="001/000003"
  opt="-h 207267-300231 -r 1-300231 --hashstrings 92965 --hashdatalen 100002108"
fi

if [ $jobid -eq 4 ] ; then
  bat="001"
  job="001/000004"
  opt="-h 300232-477096 -r 1-477096 --hashstrings 176865 --hashdatalen 100010421"
fi

if [ $jobid -eq 5 ] ; then
  bat="001"
  job="001/000005"
  opt="-h 477097-597687 -r 1-597687 --hashstrings 120591 --hashdatalen 84215189"
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
  --maxerate  0.144 \
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
