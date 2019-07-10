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


#  Store must exist: correction/rm11.gkpStore

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
  rge="-b 1 -e 9000"
  job="000001"
fi

if [ $jobid -eq 2 ] ; then
  rge="-b 9001 -e 18000"
  job="000002"
fi

if [ $jobid -eq 3 ] ; then
  rge="-b 18001 -e 27000"
  job="000003"
fi

if [ $jobid -eq 4 ] ; then
  rge="-b 27001 -e 36000"
  job="000004"
fi

if [ $jobid -eq 5 ] ; then
  rge="-b 36001 -e 45000"
  job="000005"
fi

if [ $jobid -eq 6 ] ; then
  rge="-b 45001 -e 54000"
  job="000006"
fi

if [ $jobid -eq 7 ] ; then
  rge="-b 54001 -e 63000"
  job="000007"
fi

if [ $jobid -eq 8 ] ; then
  rge="-b 63001 -e 69449"
  job="000008"
fi


if [ x$job = x ] ; then
  echo Job partitioning error.  jobid $jobid is invalid.
  exit 1
fi

if [ ! -d ./blocks ]; then
  mkdir -p ./blocks
fi

if [ -e ./blocks/$job.dat ]; then
  echo Job previously completed successfully.
  exit
fi

#  Remove any previous result.
rm -f ./blocks/$job.input.dat


$bin/gatekeeperDumpFASTQ \
  -G ../rm11.gkpStore \
  $rge \
  -nolibname \
  -fasta \
  -o ./blocks/$job.input \
|| \
mv -f ./blocks/$job.input.fasta ./blocks/$job.input.fasta.FAILED


if [ ! -e ./blocks/$job.input.fasta ] ; then
  echo Failed to extract fasta.
  exit 1
fi

#  File must exist: rm11.ms16.frequentMers.ignore.gz

echo ""
echo Starting mhap precompute.
echo ""

#  So mhap writes its output in the correct spot.
cd ./blocks

/data/apps/java/jdk1.8.0_74/bin/java -d64 -server -Xmx6144m \
  -jar  $bin/mhap-2.1.2.jar  \
  --repeat-weight 0.9 --repeat-idf-scale 10 -k 16 \
  --num-hashes 768 \
  --num-min-matches 2 \
  --ordered-sketch-size 1536 \
  --ordered-kmer-size 12 \
  --threshold 0.78 \
  --filter-threshold 0.000005 \
  --min-olap-length 500 \
  --num-threads 16 \
  -f  ../../0-mercounts/rm11.ms16.frequentMers.ignore.gz  \
  -p  ./$job.input.fasta  \
  -q  .  \
&& \
mv -f ./$job.input.dat ./$job.dat

if [ ! -e ./$job.dat ] ; then
  echo Mhap failed.
  exit 1
fi

#  Clean up, remove the fasta input
rm -f ./$job.input.fasta

#  File is important: $job.dat

exit 0
