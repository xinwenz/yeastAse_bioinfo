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
  maxid=5000
fi
if [ $jobid = 2 ] ; then
  minid=5001
  maxid=10000
fi
if [ $jobid = 3 ] ; then
  minid=10001
  maxid=15000
fi
if [ $jobid = 4 ] ; then
  minid=15001
  maxid=20000
fi
if [ $jobid = 5 ] ; then
  minid=20001
  maxid=25000
fi
if [ $jobid = 6 ] ; then
  minid=25001
  maxid=30000
fi
if [ $jobid = 7 ] ; then
  minid=30001
  maxid=35000
fi
if [ $jobid = 8 ] ; then
  minid=35001
  maxid=40000
fi
if [ $jobid = 9 ] ; then
  minid=40001
  maxid=45000
fi
if [ $jobid = 10 ] ; then
  minid=45001
  maxid=50000
fi
if [ $jobid = 11 ] ; then
  minid=50001
  maxid=55000
fi
if [ $jobid = 12 ] ; then
  minid=55001
  maxid=60000
fi
if [ $jobid = 13 ] ; then
  minid=60001
  maxid=65000
fi
if [ $jobid = 14 ] ; then
  minid=65001
  maxid=70000
fi
if [ $jobid = 15 ] ; then
  minid=70001
  maxid=75000
fi
if [ $jobid = 16 ] ; then
  minid=75001
  maxid=80000
fi
if [ $jobid = 17 ] ; then
  minid=80001
  maxid=85000
fi
if [ $jobid = 18 ] ; then
  minid=85001
  maxid=90000
fi
if [ $jobid = 19 ] ; then
  minid=90001
  maxid=95000
fi
if [ $jobid = 20 ] ; then
  minid=95001
  maxid=100000
fi
if [ $jobid = 21 ] ; then
  minid=100001
  maxid=105000
fi
if [ $jobid = 22 ] ; then
  minid=105001
  maxid=110000
fi
if [ $jobid = 23 ] ; then
  minid=110001
  maxid=115000
fi
if [ $jobid = 24 ] ; then
  minid=115001
  maxid=120000
fi
if [ $jobid = 25 ] ; then
  minid=120001
  maxid=125000
fi
if [ $jobid = 26 ] ; then
  minid=125001
  maxid=130000
fi
if [ $jobid = 27 ] ; then
  minid=130001
  maxid=135000
fi
if [ $jobid = 28 ] ; then
  minid=135001
  maxid=140000
fi
if [ $jobid = 29 ] ; then
  minid=140001
  maxid=145000
fi
if [ $jobid = 30 ] ; then
  minid=145001
  maxid=150000
fi
if [ $jobid = 31 ] ; then
  minid=150001
  maxid=155000
fi
if [ $jobid = 32 ] ; then
  minid=155001
  maxid=160000
fi
if [ $jobid = 33 ] ; then
  minid=160001
  maxid=165000
fi
if [ $jobid = 34 ] ; then
  minid=165001
  maxid=170000
fi
if [ $jobid = 35 ] ; then
  minid=170001
  maxid=175000
fi
if [ $jobid = 36 ] ; then
  minid=175001
  maxid=180000
fi
if [ $jobid = 37 ] ; then
  minid=180001
  maxid=185000
fi
if [ $jobid = 38 ] ; then
  minid=185001
  maxid=190000
fi
if [ $jobid = 39 ] ; then
  minid=190001
  maxid=195000
fi
if [ $jobid = 40 ] ; then
  minid=195001
  maxid=200000
fi
if [ $jobid = 41 ] ; then
  minid=200001
  maxid=205000
fi
if [ $jobid = 42 ] ; then
  minid=205001
  maxid=210000
fi
if [ $jobid = 43 ] ; then
  minid=210001
  maxid=215000
fi
if [ $jobid = 44 ] ; then
  minid=215001
  maxid=220000
fi
if [ $jobid = 45 ] ; then
  minid=220001
  maxid=225000
fi
if [ $jobid = 46 ] ; then
  minid=225001
  maxid=230000
fi
if [ $jobid = 47 ] ; then
  minid=230001
  maxid=235000
fi
if [ $jobid = 48 ] ; then
  minid=235001
  maxid=240000
fi
if [ $jobid = 49 ] ; then
  minid=240001
  maxid=245000
fi
if [ $jobid = 50 ] ; then
  minid=245001
  maxid=250000
fi
if [ $jobid = 51 ] ; then
  minid=250001
  maxid=255000
fi
if [ $jobid = 52 ] ; then
  minid=255001
  maxid=260000
fi
if [ $jobid = 53 ] ; then
  minid=260001
  maxid=265000
fi
if [ $jobid = 54 ] ; then
  minid=265001
  maxid=270000
fi
if [ $jobid = 55 ] ; then
  minid=270001
  maxid=275000
fi
if [ $jobid = 56 ] ; then
  minid=275001
  maxid=280000
fi
if [ $jobid = 57 ] ; then
  minid=280001
  maxid=285000
fi
if [ $jobid = 58 ] ; then
  minid=285001
  maxid=290000
fi
if [ $jobid = 59 ] ; then
  minid=290001
  maxid=295000
fi
if [ $jobid = 60 ] ; then
  minid=295001
  maxid=300000
fi
if [ $jobid = 61 ] ; then
  minid=300001
  maxid=305000
fi
if [ $jobid = 62 ] ; then
  minid=305001
  maxid=310000
fi
if [ $jobid = 63 ] ; then
  minid=310001
  maxid=315000
fi
if [ $jobid = 64 ] ; then
  minid=315001
  maxid=320000
fi
if [ $jobid = 65 ] ; then
  minid=320001
  maxid=325000
fi
if [ $jobid = 66 ] ; then
  minid=325001
  maxid=330000
fi
if [ $jobid = 67 ] ; then
  minid=330001
  maxid=335000
fi
if [ $jobid = 68 ] ; then
  minid=335001
  maxid=340000
fi
if [ $jobid = 69 ] ; then
  minid=340001
  maxid=345000
fi
if [ $jobid = 70 ] ; then
  minid=345001
  maxid=350000
fi
if [ $jobid = 71 ] ; then
  minid=350001
  maxid=355000
fi
if [ $jobid = 72 ] ; then
  minid=355001
  maxid=360000
fi
if [ $jobid = 73 ] ; then
  minid=360001
  maxid=365000
fi
if [ $jobid = 74 ] ; then
  minid=365001
  maxid=370000
fi
if [ $jobid = 75 ] ; then
  minid=370001
  maxid=375000
fi
if [ $jobid = 76 ] ; then
  minid=375001
  maxid=380000
fi
if [ $jobid = 77 ] ; then
  minid=380001
  maxid=385000
fi
if [ $jobid = 78 ] ; then
  minid=385001
  maxid=390000
fi
if [ $jobid = 79 ] ; then
  minid=390001
  maxid=395000
fi
if [ $jobid = 80 ] ; then
  minid=395001
  maxid=400000
fi
if [ $jobid = 81 ] ; then
  minid=400001
  maxid=405000
fi
if [ $jobid = 82 ] ; then
  minid=405001
  maxid=410000
fi
if [ $jobid = 83 ] ; then
  minid=410001
  maxid=415000
fi
if [ $jobid = 84 ] ; then
  minid=415001
  maxid=420000
fi
if [ $jobid = 85 ] ; then
  minid=420001
  maxid=425000
fi
if [ $jobid = 86 ] ; then
  minid=425001
  maxid=430000
fi
if [ $jobid = 87 ] ; then
  minid=430001
  maxid=435000
fi
if [ $jobid = 88 ] ; then
  minid=435001
  maxid=440000
fi
if [ $jobid = 89 ] ; then
  minid=440001
  maxid=445000
fi
if [ $jobid = 90 ] ; then
  minid=445001
  maxid=450000
fi
if [ $jobid = 91 ] ; then
  minid=450001
  maxid=455000
fi
if [ $jobid = 92 ] ; then
  minid=455001
  maxid=460000
fi
if [ $jobid = 93 ] ; then
  minid=460001
  maxid=465000
fi
if [ $jobid = 94 ] ; then
  minid=465001
  maxid=470000
fi
if [ $jobid = 95 ] ; then
  minid=470001
  maxid=475000
fi
if [ $jobid = 96 ] ; then
  minid=475001
  maxid=480000
fi
if [ $jobid = 97 ] ; then
  minid=480001
  maxid=485000
fi
if [ $jobid = 98 ] ; then
  minid=485001
  maxid=490000
fi
if [ $jobid = 99 ] ; then
  minid=490001
  maxid=495000
fi
if [ $jobid = 100 ] ; then
  minid=495001
  maxid=500000
fi
if [ $jobid = 101 ] ; then
  minid=500001
  maxid=505000
fi
if [ $jobid = 102 ] ; then
  minid=505001
  maxid=510000
fi
if [ $jobid = 103 ] ; then
  minid=510001
  maxid=515000
fi
if [ $jobid = 104 ] ; then
  minid=515001
  maxid=520000
fi
if [ $jobid = 105 ] ; then
  minid=520001
  maxid=525000
fi
if [ $jobid = 106 ] ; then
  minid=525001
  maxid=530000
fi
if [ $jobid = 107 ] ; then
  minid=530001
  maxid=535000
fi
if [ $jobid = 108 ] ; then
  minid=535001
  maxid=540000
fi
if [ $jobid = 109 ] ; then
  minid=540001
  maxid=545000
fi
if [ $jobid = 110 ] ; then
  minid=545001
  maxid=550000
fi
if [ $jobid = 111 ] ; then
  minid=550001
  maxid=555000
fi
if [ $jobid = 112 ] ; then
  minid=555001
  maxid=560000
fi
if [ $jobid = 113 ] ; then
  minid=560001
  maxid=565000
fi
if [ $jobid = 114 ] ; then
  minid=565001
  maxid=570000
fi
if [ $jobid = 115 ] ; then
  minid=570001
  maxid=575000
fi
if [ $jobid = 116 ] ; then
  minid=575001
  maxid=580000
fi
if [ $jobid = 117 ] ; then
  minid=580001
  maxid=585000
fi
if [ $jobid = 118 ] ; then
  minid=585001
  maxid=590000
fi
if [ $jobid = 119 ] ; then
  minid=590001
  maxid=595000
fi
if [ $jobid = 120 ] ; then
  minid=595001
  maxid=600000
fi
if [ $jobid = 121 ] ; then
  minid=600001
  maxid=605000
fi
if [ $jobid = 122 ] ; then
  minid=605001
  maxid=610000
fi
if [ $jobid = 123 ] ; then
  minid=610001
  maxid=615000
fi
if [ $jobid = 124 ] ; then
  minid=615001
  maxid=620000
fi
if [ $jobid = 125 ] ; then
  minid=620001
  maxid=625000
fi
if [ $jobid = 126 ] ; then
  minid=625001
  maxid=630000
fi
if [ $jobid = 127 ] ; then
  minid=630001
  maxid=633487
fi
jobid=`printf %05d $jobid`

if [ -e ./$jobid.red ] ; then
  echo Job previously completed successfully.
  exit
fi

$bin/findErrors \
  -G ../cbs432.gkpStore \
  -O ../cbs432.ovlStore \
  -R $minid $maxid \
  -e 0.144 -l 500 \
  -o ./$jobid.red.WORKING \
  -t 4 \
&& \
mv ./$jobid.red.WORKING ./$jobid.red

#  File is important: $jobid.red

