#!/bin/bash



#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/dfs1/bio/mchakrab/pacbio/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/dfs1/bio/mchakrab/pacbio/canu"
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
  maxid=25000
fi
if [ $jobid = 2 ] ; then
  minid=25001
  maxid=50000
fi
if [ $jobid = 3 ] ; then
  minid=50001
  maxid=75000
fi
if [ $jobid = 4 ] ; then
  minid=75001
  maxid=100000
fi
if [ $jobid = 5 ] ; then
  minid=100001
  maxid=125000
fi
if [ $jobid = 6 ] ; then
  minid=125001
  maxid=150000
fi
if [ $jobid = 7 ] ; then
  minid=150001
  maxid=175000
fi
if [ $jobid = 8 ] ; then
  minid=175001
  maxid=200000
fi
if [ $jobid = 9 ] ; then
  minid=200001
  maxid=225000
fi
if [ $jobid = 10 ] ; then
  minid=225001
  maxid=250000
fi
if [ $jobid = 11 ] ; then
  minid=250001
  maxid=275000
fi
if [ $jobid = 12 ] ; then
  minid=275001
  maxid=300000
fi
if [ $jobid = 13 ] ; then
  minid=300001
  maxid=325000
fi
if [ $jobid = 14 ] ; then
  minid=325001
  maxid=350000
fi
if [ $jobid = 15 ] ; then
  minid=350001
  maxid=375000
fi
if [ $jobid = 16 ] ; then
  minid=375001
  maxid=400000
fi
if [ $jobid = 17 ] ; then
  minid=400001
  maxid=425000
fi
if [ $jobid = 18 ] ; then
  minid=425001
  maxid=450000
fi
if [ $jobid = 19 ] ; then
  minid=450001
  maxid=475000
fi
if [ $jobid = 20 ] ; then
  minid=475001
  maxid=500000
fi
if [ $jobid = 21 ] ; then
  minid=500001
  maxid=525000
fi
if [ $jobid = 22 ] ; then
  minid=525001
  maxid=550000
fi
if [ $jobid = 23 ] ; then
  minid=550001
  maxid=575000
fi
if [ $jobid = 24 ] ; then
  minid=575001
  maxid=600000
fi
if [ $jobid = 25 ] ; then
  minid=600001
  maxid=625000
fi
if [ $jobid = 26 ] ; then
  minid=625001
  maxid=633487
fi
jobid=`printf %05d $jobid`

if [ -e ./$jobid.oea ] ; then
  echo Job previously completed successfully.
  exit
fi

#  File must exist: red.red

$bin/correctOverlaps \
  -G ../cbs432.gkpStore \
  -O ../cbs432.ovlStore \
  -R $minid $maxid \
  -e 0.144 -l 500 \
  -c ./red.red \
  -o ./$jobid.oea.WORKING \
&& \
mv ./$jobid.oea.WORKING ./$jobid.oea

#  File is important: $jobid.oea

