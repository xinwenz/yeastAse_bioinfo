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
  blk="000001"
  slf=""
  cvt="-h 1 0 -q 1"
  qry="000001"
fi

if [ $jobid -eq 2 ] ; then
  blk="000001"
  slf="--no-self"
  cvt="-h 1 9000 -q 27001"
  qry="000002"
fi

if [ $jobid -eq 3 ] ; then
  blk="000001"
  slf="--no-self"
  cvt="-h 1 9000 -q 45001"
  qry="000003"
fi

if [ $jobid -eq 4 ] ; then
  blk="000001"
  slf="--no-self"
  cvt="-h 1 9000 -q 63001"
  qry="000004"
fi

if [ $jobid -eq 5 ] ; then
  blk="000002"
  slf=""
  cvt="-h 9001 0 -q 9001"
  qry="000005"
fi

if [ $jobid -eq 6 ] ; then
  blk="000002"
  slf="--no-self"
  cvt="-h 9001 9000 -q 36001"
  qry="000006"
fi

if [ $jobid -eq 7 ] ; then
  blk="000002"
  slf="--no-self"
  cvt="-h 9001 9000 -q 54001"
  qry="000007"
fi

if [ $jobid -eq 8 ] ; then
  blk="000003"
  slf=""
  cvt="-h 18001 0 -q 18001"
  qry="000008"
fi

if [ $jobid -eq 9 ] ; then
  blk="000003"
  slf="--no-self"
  cvt="-h 18001 9000 -q 45001"
  qry="000009"
fi

if [ $jobid -eq 10 ] ; then
  blk="000003"
  slf="--no-self"
  cvt="-h 18001 9000 -q 63001"
  qry="000010"
fi

if [ $jobid -eq 11 ] ; then
  blk="000004"
  slf=""
  cvt="-h 27001 0 -q 27001"
  qry="000011"
fi

if [ $jobid -eq 12 ] ; then
  blk="000004"
  slf="--no-self"
  cvt="-h 27001 9000 -q 54001"
  qry="000012"
fi

if [ $jobid -eq 13 ] ; then
  blk="000005"
  slf=""
  cvt="-h 36001 0 -q 36001"
  qry="000013"
fi

if [ $jobid -eq 14 ] ; then
  blk="000005"
  slf="--no-self"
  cvt="-h 36001 9000 -q 63001"
  qry="000014"
fi

if [ $jobid -eq 15 ] ; then
  blk="000006"
  slf=""
  cvt="-h 45001 0 -q 45001"
  qry="000015"
fi

if [ $jobid -eq 16 ] ; then
  blk="000007"
  slf=""
  cvt="-h 54001 0 -q 54001"
  qry="000016"
fi

if [ $jobid -eq 17 ] ; then
  blk="000008"
  slf=""
  cvt="-h 63001 0 -q 63001"
  qry="000017"
fi


if [ x$qry = x ]; then
  echo Error: Job index out of range.
  exit 1
fi

if [ -e ./results/$qry.ovb ]; then
  echo Job previously completed successfully.
  exit
fi

#  File must exist: queries.tar

if [ -e ./queries.tar -a ! -d ./queries ] ; then
  tar -xf ./queries.tar
fi

if [ ! -d ./results ]; then
  mkdir -p ./results
fi

if [ ! -d ./blocks ] ; then
  mkdir -p ./blocks
fi
#  File must exist: blocks/$blk.dat
for ii in `ls ./queries/$qry` ; do
  echo Fetch blocks/$ii
#  File must exist: blocks/$ii
done

#  File must exist: rm11.ms16.frequentMers.ignore.gz

echo ""
echo Running block $blk in query $qry
echo ""

if [ ! -e ./results/$qry.mhap ] ; then
  /data/apps/java/jdk1.8.0_74/bin/java -d64 -server -Xmx6144m \
    -jar  $bin/mhap-2.1.2.jar  \
    --repeat-weight 0.9 --repeat-idf-scale 10 -k 16 \
    --num-hashes 768 \
    --num-min-matches 2 \
    --threshold 0.78 \
    --filter-threshold 0.000005 \
    --ordered-sketch-size 1536 \
    --ordered-kmer-size 12 \
    --min-olap-length 500 \
    --num-threads 16 \
    -s  ./blocks/$blk.dat $slf  \
    -q  queries/$qry  \
  > ./results/$qry.mhap.WORKING \
  && \
  mv -f ./results/$qry.mhap.WORKING ./results/$qry.mhap
fi

if [   -e ./results/$qry.mhap -a \
     ! -e ./results/$qry.ovb ] ; then
  $bin/mhapConvert \
    -G ../rm11.gkpStore \
    $cvt \
    -o ./results/$qry.mhap.ovb.WORKING \
    ./results/$qry.mhap \
  && \
  mv ./results/$qry.mhap.ovb.WORKING ./results/$qry.mhap.ovb
fi

if [   -e ./results/$qry.mhap -a \
       -e ./results/$qry.mhap.ovb ] ; then
  rm -f ./results/$qry.mhap
fi

if [ -e ./results/$qry.mhap.ovb ] ; then
  mv -f ./results/$qry.mhap.ovb ./results/$qry.ovb
fi

#  File is important: results/$qry.ovb
#  File is important: results/$qry.counts

exit 0
