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

if [ $jobid -gt 14 ]; then
  echo Error: Only 14 partitions, you asked for $jobid.
  exit 1
fi

if [ $jobid -eq 1 ] ; then
  bgn=1
  end=5000
fi
if [ $jobid -eq 2 ] ; then
  bgn=5001
  end=10000
fi
if [ $jobid -eq 3 ] ; then
  bgn=10001
  end=15000
fi
if [ $jobid -eq 4 ] ; then
  bgn=15001
  end=20000
fi
if [ $jobid -eq 5 ] ; then
  bgn=20001
  end=25000
fi
if [ $jobid -eq 6 ] ; then
  bgn=25001
  end=30000
fi
if [ $jobid -eq 7 ] ; then
  bgn=30001
  end=35000
fi
if [ $jobid -eq 8 ] ; then
  bgn=35001
  end=40000
fi
if [ $jobid -eq 9 ] ; then
  bgn=40001
  end=45000
fi
if [ $jobid -eq 10 ] ; then
  bgn=45001
  end=50000
fi
if [ $jobid -eq 11 ] ; then
  bgn=50001
  end=55000
fi
if [ $jobid -eq 12 ] ; then
  bgn=55001
  end=60000
fi
if [ $jobid -eq 13 ] ; then
  bgn=60001
  end=65000
fi
if [ $jobid -eq 14 ] ; then
  bgn=65001
  end=69449
fi

jobid=`printf %04d $jobid`

if [ -e "./results/$jobid.fasta" ] ; then
  echo Job finished successfully.
  exit 0
fi

if [ ! -d "./results" ] ; then
  mkdir -p "./results"
fi

#  Store must exist: correction/rm11.gkpStore

#  Store must exist: correction/rm11.ovlStore

#  File must exist: rm11.readsToCorrect

#  File must exist: rm11.globalScores

gkpStore="../rm11.gkpStore"


$bin/falconsense \
  -G $gkpStore \
  -C ../rm11.corStore \
  -b $bgn -e $end -r ./rm11.readsToCorrect \
  -t  4 \
  -ci 0.5\
  -cl 1000\
  -cc 4 \
  > ./results/$jobid.fasta.WORKING \
 2> ./results/$jobid.err \
&& \
mv ./results/$jobid.fasta.WORKING ./results/$jobid.fasta \

#  File is important: results/$jobid.fasta

exit 0
