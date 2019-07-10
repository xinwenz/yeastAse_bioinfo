#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/dfs1/bio/mchakrab/pacbio/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/dfs1/bio/mchakrab/pacbio/canu"
fi


#  Store must exist: correction/yps128.gkpStore

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
  rge="-b 63001 -e 72000"
  job="000008"
fi

if [ $jobid -eq 9 ] ; then
  rge="-b 72001 -e 81000"
  job="000009"
fi

if [ $jobid -eq 10 ] ; then
  rge="-b 81001 -e 90000"
  job="000010"
fi

if [ $jobid -eq 11 ] ; then
  rge="-b 90001 -e 99000"
  job="000011"
fi

if [ $jobid -eq 12 ] ; then
  rge="-b 99001 -e 108000"
  job="000012"
fi

if [ $jobid -eq 13 ] ; then
  rge="-b 108001 -e 117000"
  job="000013"
fi

if [ $jobid -eq 14 ] ; then
  rge="-b 117001 -e 126000"
  job="000014"
fi

if [ $jobid -eq 15 ] ; then
  rge="-b 126001 -e 135000"
  job="000015"
fi

if [ $jobid -eq 16 ] ; then
  rge="-b 135001 -e 144000"
  job="000016"
fi

if [ $jobid -eq 17 ] ; then
  rge="-b 144001 -e 153000"
  job="000017"
fi

if [ $jobid -eq 18 ] ; then
  rge="-b 153001 -e 162000"
  job="000018"
fi

if [ $jobid -eq 19 ] ; then
  rge="-b 162001 -e 171000"
  job="000019"
fi

if [ $jobid -eq 20 ] ; then
  rge="-b 171001 -e 180000"
  job="000020"
fi

if [ $jobid -eq 21 ] ; then
  rge="-b 180001 -e 189000"
  job="000021"
fi

if [ $jobid -eq 22 ] ; then
  rge="-b 189001 -e 198000"
  job="000022"
fi

if [ $jobid -eq 23 ] ; then
  rge="-b 198001 -e 207000"
  job="000023"
fi

if [ $jobid -eq 24 ] ; then
  rge="-b 207001 -e 216000"
  job="000024"
fi

if [ $jobid -eq 25 ] ; then
  rge="-b 216001 -e 225000"
  job="000025"
fi

if [ $jobid -eq 26 ] ; then
  rge="-b 225001 -e 234000"
  job="000026"
fi

if [ $jobid -eq 27 ] ; then
  rge="-b 234001 -e 243000"
  job="000027"
fi

if [ $jobid -eq 28 ] ; then
  rge="-b 243001 -e 252000"
  job="000028"
fi

if [ $jobid -eq 29 ] ; then
  rge="-b 252001 -e 261000"
  job="000029"
fi

if [ $jobid -eq 30 ] ; then
  rge="-b 261001 -e 270000"
  job="000030"
fi

if [ $jobid -eq 31 ] ; then
  rge="-b 270001 -e 279000"
  job="000031"
fi

if [ $jobid -eq 32 ] ; then
  rge="-b 279001 -e 288000"
  job="000032"
fi

if [ $jobid -eq 33 ] ; then
  rge="-b 288001 -e 297000"
  job="000033"
fi

if [ $jobid -eq 34 ] ; then
  rge="-b 297001 -e 306000"
  job="000034"
fi

if [ $jobid -eq 35 ] ; then
  rge="-b 306001 -e 315000"
  job="000035"
fi

if [ $jobid -eq 36 ] ; then
  rge="-b 315001 -e 324000"
  job="000036"
fi

if [ $jobid -eq 37 ] ; then
  rge="-b 324001 -e 333000"
  job="000037"
fi

if [ $jobid -eq 38 ] ; then
  rge="-b 333001 -e 342000"
  job="000038"
fi

if [ $jobid -eq 39 ] ; then
  rge="-b 342001 -e 351000"
  job="000039"
fi

if [ $jobid -eq 40 ] ; then
  rge="-b 351001 -e 360000"
  job="000040"
fi

if [ $jobid -eq 41 ] ; then
  rge="-b 360001 -e 369000"
  job="000041"
fi

if [ $jobid -eq 42 ] ; then
  rge="-b 369001 -e 378000"
  job="000042"
fi

if [ $jobid -eq 43 ] ; then
  rge="-b 378001 -e 387000"
  job="000043"
fi

if [ $jobid -eq 44 ] ; then
  rge="-b 387001 -e 396000"
  job="000044"
fi

if [ $jobid -eq 45 ] ; then
  rge="-b 396001 -e 405000"
  job="000045"
fi

if [ $jobid -eq 46 ] ; then
  rge="-b 405001 -e 414000"
  job="000046"
fi

if [ $jobid -eq 47 ] ; then
  rge="-b 414001 -e 423000"
  job="000047"
fi

if [ $jobid -eq 48 ] ; then
  rge="-b 423001 -e 432000"
  job="000048"
fi

if [ $jobid -eq 49 ] ; then
  rge="-b 432001 -e 441000"
  job="000049"
fi

if [ $jobid -eq 50 ] ; then
  rge="-b 441001 -e 450000"
  job="000050"
fi

if [ $jobid -eq 51 ] ; then
  rge="-b 450001 -e 459000"
  job="000051"
fi

if [ $jobid -eq 52 ] ; then
  rge="-b 459001 -e 468000"
  job="000052"
fi

if [ $jobid -eq 53 ] ; then
  rge="-b 468001 -e 477000"
  job="000053"
fi

if [ $jobid -eq 54 ] ; then
  rge="-b 477001 -e 486000"
  job="000054"
fi

if [ $jobid -eq 55 ] ; then
  rge="-b 486001 -e 495000"
  job="000055"
fi

if [ $jobid -eq 56 ] ; then
  rge="-b 495001 -e 504000"
  job="000056"
fi

if [ $jobid -eq 57 ] ; then
  rge="-b 504001 -e 513000"
  job="000057"
fi

if [ $jobid -eq 58 ] ; then
  rge="-b 513001 -e 522000"
  job="000058"
fi

if [ $jobid -eq 59 ] ; then
  rge="-b 522001 -e 531000"
  job="000059"
fi

if [ $jobid -eq 60 ] ; then
  rge="-b 531001 -e 540000"
  job="000060"
fi

if [ $jobid -eq 61 ] ; then
  rge="-b 540001 -e 549000"
  job="000061"
fi

if [ $jobid -eq 62 ] ; then
  rge="-b 549001 -e 558000"
  job="000062"
fi

if [ $jobid -eq 63 ] ; then
  rge="-b 558001 -e 567000"
  job="000063"
fi

if [ $jobid -eq 64 ] ; then
  rge="-b 567001 -e 576000"
  job="000064"
fi

if [ $jobid -eq 65 ] ; then
  rge="-b 576001 -e 585000"
  job="000065"
fi

if [ $jobid -eq 66 ] ; then
  rge="-b 585001 -e 594000"
  job="000066"
fi

if [ $jobid -eq 67 ] ; then
  rge="-b 594001 -e 597687"
  job="000067"
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
  -G ../yps128.gkpStore \
  $rge \
  -nolibname \
  -noreadname \
  -fasta \
  -o ./blocks/$job.input \
|| \
mv -f ./blocks/$job.input.fasta ./blocks/$job.input.fasta.FAILED


if [ ! -e ./blocks/$job.input.fasta ] ; then
  echo Failed to extract fasta.
  exit 1
fi

#  File must exist: yps128.ms16.frequentMers.ignore.gz

echo ""
echo Starting mhap precompute.
echo ""

#  So mhap writes its output in the correct spot.
cd ./blocks

/data/apps/java/jdk1.8.0_74/bin/java -d64 -server -Xmx6144m \
  -jar  $bin/../share/java/classes/mhap-2.1.3.jar  \
  --repeat-weight 0.9 --repeat-idf-scale 10 -k 16 \
  --store-full-id \
  --num-hashes 768 \
  --num-min-matches 2 \
  --ordered-sketch-size 1536 \
  --ordered-kmer-size 12 \
  --threshold 0.78 \
  --filter-threshold 0.000005 \
  --min-olap-length 500 \
  --num-threads 16 \
  -f  ../../0-mercounts/yps128.ms16.frequentMers.ignore.gz  \
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
