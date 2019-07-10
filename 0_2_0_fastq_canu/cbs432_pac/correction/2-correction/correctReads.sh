#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/data/apps/user_contributed_software/mchakrab/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/data/apps/user_contributed_software/mchakrab/canu"
fi


#  Store must exist: correction/cbs432.gkpStore

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

if [ $jobid -gt 125 ]; then
  echo Error: Only 125 partitions, you asked for $jobid.
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
  end=70000
fi
if [ $jobid -eq 15 ] ; then
  bgn=70001
  end=75000
fi
if [ $jobid -eq 16 ] ; then
  bgn=75001
  end=80000
fi
if [ $jobid -eq 17 ] ; then
  bgn=80001
  end=85000
fi
if [ $jobid -eq 18 ] ; then
  bgn=85001
  end=90000
fi
if [ $jobid -eq 19 ] ; then
  bgn=90001
  end=95000
fi
if [ $jobid -eq 20 ] ; then
  bgn=95001
  end=100000
fi
if [ $jobid -eq 21 ] ; then
  bgn=100001
  end=105000
fi
if [ $jobid -eq 22 ] ; then
  bgn=105001
  end=110000
fi
if [ $jobid -eq 23 ] ; then
  bgn=110001
  end=115000
fi
if [ $jobid -eq 24 ] ; then
  bgn=115001
  end=120000
fi
if [ $jobid -eq 25 ] ; then
  bgn=120001
  end=125000
fi
if [ $jobid -eq 26 ] ; then
  bgn=125001
  end=130000
fi
if [ $jobid -eq 27 ] ; then
  bgn=130001
  end=135000
fi
if [ $jobid -eq 28 ] ; then
  bgn=135001
  end=140000
fi
if [ $jobid -eq 29 ] ; then
  bgn=140001
  end=145000
fi
if [ $jobid -eq 30 ] ; then
  bgn=145001
  end=150000
fi
if [ $jobid -eq 31 ] ; then
  bgn=150001
  end=155000
fi
if [ $jobid -eq 32 ] ; then
  bgn=155001
  end=160000
fi
if [ $jobid -eq 33 ] ; then
  bgn=160001
  end=165000
fi
if [ $jobid -eq 34 ] ; then
  bgn=165001
  end=170000
fi
if [ $jobid -eq 35 ] ; then
  bgn=170001
  end=175000
fi
if [ $jobid -eq 36 ] ; then
  bgn=175001
  end=180000
fi
if [ $jobid -eq 37 ] ; then
  bgn=180001
  end=185000
fi
if [ $jobid -eq 38 ] ; then
  bgn=185001
  end=190000
fi
if [ $jobid -eq 39 ] ; then
  bgn=190001
  end=195000
fi
if [ $jobid -eq 40 ] ; then
  bgn=195001
  end=200000
fi
if [ $jobid -eq 41 ] ; then
  bgn=200001
  end=205000
fi
if [ $jobid -eq 42 ] ; then
  bgn=205001
  end=210000
fi
if [ $jobid -eq 43 ] ; then
  bgn=210001
  end=215000
fi
if [ $jobid -eq 44 ] ; then
  bgn=215001
  end=220000
fi
if [ $jobid -eq 45 ] ; then
  bgn=220001
  end=225000
fi
if [ $jobid -eq 46 ] ; then
  bgn=225001
  end=230000
fi
if [ $jobid -eq 47 ] ; then
  bgn=230001
  end=235000
fi
if [ $jobid -eq 48 ] ; then
  bgn=235001
  end=240000
fi
if [ $jobid -eq 49 ] ; then
  bgn=240001
  end=245000
fi
if [ $jobid -eq 50 ] ; then
  bgn=245001
  end=250000
fi
if [ $jobid -eq 51 ] ; then
  bgn=250001
  end=255000
fi
if [ $jobid -eq 52 ] ; then
  bgn=255001
  end=260000
fi
if [ $jobid -eq 53 ] ; then
  bgn=260001
  end=265000
fi
if [ $jobid -eq 54 ] ; then
  bgn=265001
  end=270000
fi
if [ $jobid -eq 55 ] ; then
  bgn=270001
  end=275000
fi
if [ $jobid -eq 56 ] ; then
  bgn=275001
  end=280000
fi
if [ $jobid -eq 57 ] ; then
  bgn=280001
  end=285000
fi
if [ $jobid -eq 58 ] ; then
  bgn=285001
  end=290000
fi
if [ $jobid -eq 59 ] ; then
  bgn=290001
  end=295000
fi
if [ $jobid -eq 60 ] ; then
  bgn=295001
  end=300000
fi
if [ $jobid -eq 61 ] ; then
  bgn=300001
  end=305000
fi
if [ $jobid -eq 62 ] ; then
  bgn=305001
  end=310000
fi
if [ $jobid -eq 63 ] ; then
  bgn=310001
  end=315000
fi
if [ $jobid -eq 64 ] ; then
  bgn=315001
  end=320000
fi
if [ $jobid -eq 65 ] ; then
  bgn=320001
  end=325000
fi
if [ $jobid -eq 66 ] ; then
  bgn=325001
  end=330000
fi
if [ $jobid -eq 67 ] ; then
  bgn=330001
  end=335000
fi
if [ $jobid -eq 68 ] ; then
  bgn=335001
  end=340000
fi
if [ $jobid -eq 69 ] ; then
  bgn=340001
  end=345000
fi
if [ $jobid -eq 70 ] ; then
  bgn=345001
  end=350000
fi
if [ $jobid -eq 71 ] ; then
  bgn=350001
  end=355000
fi
if [ $jobid -eq 72 ] ; then
  bgn=355001
  end=360000
fi
if [ $jobid -eq 73 ] ; then
  bgn=360001
  end=365000
fi
if [ $jobid -eq 74 ] ; then
  bgn=365001
  end=370000
fi
if [ $jobid -eq 75 ] ; then
  bgn=370001
  end=375000
fi
if [ $jobid -eq 76 ] ; then
  bgn=375001
  end=380000
fi
if [ $jobid -eq 77 ] ; then
  bgn=380001
  end=385000
fi
if [ $jobid -eq 78 ] ; then
  bgn=385001
  end=390000
fi
if [ $jobid -eq 79 ] ; then
  bgn=390001
  end=395000
fi
if [ $jobid -eq 80 ] ; then
  bgn=395001
  end=400000
fi
if [ $jobid -eq 81 ] ; then
  bgn=400001
  end=405000
fi
if [ $jobid -eq 82 ] ; then
  bgn=405001
  end=410000
fi
if [ $jobid -eq 83 ] ; then
  bgn=410001
  end=415000
fi
if [ $jobid -eq 84 ] ; then
  bgn=415001
  end=420000
fi
if [ $jobid -eq 85 ] ; then
  bgn=420001
  end=425000
fi
if [ $jobid -eq 86 ] ; then
  bgn=425001
  end=430000
fi
if [ $jobid -eq 87 ] ; then
  bgn=430001
  end=435000
fi
if [ $jobid -eq 88 ] ; then
  bgn=435001
  end=440000
fi
if [ $jobid -eq 89 ] ; then
  bgn=440001
  end=445000
fi
if [ $jobid -eq 90 ] ; then
  bgn=445001
  end=450000
fi
if [ $jobid -eq 91 ] ; then
  bgn=450001
  end=455000
fi
if [ $jobid -eq 92 ] ; then
  bgn=455001
  end=460000
fi
if [ $jobid -eq 93 ] ; then
  bgn=460001
  end=465000
fi
if [ $jobid -eq 94 ] ; then
  bgn=465001
  end=470000
fi
if [ $jobid -eq 95 ] ; then
  bgn=470001
  end=475000
fi
if [ $jobid -eq 96 ] ; then
  bgn=475001
  end=480000
fi
if [ $jobid -eq 97 ] ; then
  bgn=480001
  end=485000
fi
if [ $jobid -eq 98 ] ; then
  bgn=485001
  end=490000
fi
if [ $jobid -eq 99 ] ; then
  bgn=490001
  end=495000
fi
if [ $jobid -eq 100 ] ; then
  bgn=495001
  end=500000
fi
if [ $jobid -eq 101 ] ; then
  bgn=500001
  end=505000
fi
if [ $jobid -eq 102 ] ; then
  bgn=505001
  end=510000
fi
if [ $jobid -eq 103 ] ; then
  bgn=510001
  end=515000
fi
if [ $jobid -eq 104 ] ; then
  bgn=515001
  end=520000
fi
if [ $jobid -eq 105 ] ; then
  bgn=520001
  end=525000
fi
if [ $jobid -eq 106 ] ; then
  bgn=525001
  end=530000
fi
if [ $jobid -eq 107 ] ; then
  bgn=530001
  end=535000
fi
if [ $jobid -eq 108 ] ; then
  bgn=535001
  end=540000
fi
if [ $jobid -eq 109 ] ; then
  bgn=540001
  end=545000
fi
if [ $jobid -eq 110 ] ; then
  bgn=545001
  end=550000
fi
if [ $jobid -eq 111 ] ; then
  bgn=550001
  end=555000
fi
if [ $jobid -eq 112 ] ; then
  bgn=555001
  end=560000
fi
if [ $jobid -eq 113 ] ; then
  bgn=560001
  end=565000
fi
if [ $jobid -eq 114 ] ; then
  bgn=565001
  end=570000
fi
if [ $jobid -eq 115 ] ; then
  bgn=570001
  end=575000
fi
if [ $jobid -eq 116 ] ; then
  bgn=575001
  end=580000
fi
if [ $jobid -eq 117 ] ; then
  bgn=580001
  end=585000
fi
if [ $jobid -eq 118 ] ; then
  bgn=585001
  end=590000
fi
if [ $jobid -eq 119 ] ; then
  bgn=590001
  end=595000
fi
if [ $jobid -eq 120 ] ; then
  bgn=595001
  end=600000
fi
if [ $jobid -eq 121 ] ; then
  bgn=600001
  end=605000
fi
if [ $jobid -eq 122 ] ; then
  bgn=605001
  end=610000
fi
if [ $jobid -eq 123 ] ; then
  bgn=610001
  end=615000
fi
if [ $jobid -eq 124 ] ; then
  bgn=615001
  end=620000
fi
if [ $jobid -eq 125 ] ; then
  bgn=620001
  end=621502
fi

jobid=`printf %04d $jobid`

if [ -e "./results/$jobid.cns" ] ; then
  echo Job finished successfully.
  exit 0
fi

if [ ! -d "./results" ] ; then
  mkdir -p "./results"
fi

#  Store must exist: correction/cbs432.gkpStore

#  Store must exist: correction/cbs432.ovlStore

#  File must exist: cbs432.readsToCorrect

#  File must exist: cbs432.globalScores

gkpStore="../cbs432.gkpStore"


$bin/falconsense \
  -G $gkpStore \
  -C ../cbs432.corStore \
  -b $bgn -e $end -r ./cbs432.readsToCorrect \
  -t  4 \
  -cc 4 \
  -cl 1000 \
  -oi 0.7 \
  -ol 500 \
  -p ./results/$jobid.WORKING \
  > ./results/$jobid.err 2>&1 \
&& \
mv ./results/$jobid.WORKING.cns ./results/$jobid.cns \

#  File is important: results/$jobid.cns

exit 0
