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


#  Store must exist: unitigging/rm11.gkpStore
#  Store must exist: unitigging/rm11.ovlStore

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
  maxid=999
fi
if [ $jobid = 2 ] ; then
  minid=1000
  maxid=2019
fi
if [ $jobid = 3 ] ; then
  minid=2020
  maxid=3041
fi
if [ $jobid = 4 ] ; then
  minid=3042
  maxid=4041
fi
if [ $jobid = 5 ] ; then
  minid=4042
  maxid=5050
fi
if [ $jobid = 6 ] ; then
  minid=5051
  maxid=6049
fi
if [ $jobid = 7 ] ; then
  minid=6050
  maxid=7040
fi
if [ $jobid = 8 ] ; then
  minid=7041
  maxid=8043
fi
if [ $jobid = 9 ] ; then
  minid=8044
  maxid=9067
fi
if [ $jobid = 10 ] ; then
  minid=9068
  maxid=10049
fi
if [ $jobid = 11 ] ; then
  minid=10050
  maxid=11039
fi
if [ $jobid = 12 ] ; then
  minid=11040
  maxid=12033
fi
if [ $jobid = 13 ] ; then
  minid=12034
  maxid=13022
fi
if [ $jobid = 14 ] ; then
  minid=13023
  maxid=13999
fi
if [ $jobid = 15 ] ; then
  minid=14000
  maxid=15009
fi
if [ $jobid = 16 ] ; then
  minid=15010
  maxid=16046
fi
if [ $jobid = 17 ] ; then
  minid=16047
  maxid=17011
fi
if [ $jobid = 18 ] ; then
  minid=17012
  maxid=17991
fi
if [ $jobid = 19 ] ; then
  minid=17992
  maxid=18943
fi
if [ $jobid = 20 ] ; then
  minid=18944
  maxid=19888
fi
if [ $jobid = 21 ] ; then
  minid=19889
  maxid=20852
fi
if [ $jobid = 22 ] ; then
  minid=20853
  maxid=21800
fi
if [ $jobid = 23 ] ; then
  minid=21801
  maxid=22765
fi
if [ $jobid = 24 ] ; then
  minid=22766
  maxid=23751
fi
if [ $jobid = 25 ] ; then
  minid=23752
  maxid=24756
fi
if [ $jobid = 26 ] ; then
  minid=24757
  maxid=25582
fi
jobid=`printf %05d $jobid`

if [ -e ./$jobid.red ] ; then
  echo Job previously completed successfully.
  exit
fi

$bin/findErrors \
  -G ../rm11.gkpStore \
  -O ../rm11.ovlStore \
  -R $minid $maxid \
  -e 0.144 -l 500 \
  -o ./$jobid.red.WORKING \
  -t 4 \
&& \
mv ./$jobid.red.WORKING ./$jobid.red

#  File is important: $jobid.red

