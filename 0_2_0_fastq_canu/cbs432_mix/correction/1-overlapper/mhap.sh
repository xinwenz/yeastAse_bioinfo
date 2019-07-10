#!/bin/bash


#  Path to Canu.

syst=`uname -s`
arch=`uname -m | sed s/x86_64/amd64/`

bin="/dfs1/bio/mchakrab/pacbio/canu/$syst-$arch/bin"

if [ ! -d "$bin" ] ; then
  bin="/dfs1/bio/mchakrab/pacbio/canu"
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

if [ $jobid -eq 1 ] ; then
  blk="000001"
  slf=""
  qry="000001"
fi

if [ $jobid -eq 2 ] ; then
  blk="000001"
  slf="--no-self"
  qry="000002"
fi

if [ $jobid -eq 3 ] ; then
  blk="000001"
  slf="--no-self"
  qry="000003"
fi

if [ $jobid -eq 4 ] ; then
  blk="000001"
  slf="--no-self"
  qry="000004"
fi

if [ $jobid -eq 5 ] ; then
  blk="000002"
  slf=""
  qry="000005"
fi

if [ $jobid -eq 6 ] ; then
  blk="000002"
  slf="--no-self"
  qry="000006"
fi

if [ $jobid -eq 7 ] ; then
  blk="000002"
  slf="--no-self"
  qry="000007"
fi

if [ $jobid -eq 8 ] ; then
  blk="000002"
  slf="--no-self"
  qry="000008"
fi

if [ $jobid -eq 9 ] ; then
  blk="000003"
  slf=""
  qry="000009"
fi

if [ $jobid -eq 10 ] ; then
  blk="000003"
  slf="--no-self"
  qry="000010"
fi

if [ $jobid -eq 11 ] ; then
  blk="000003"
  slf="--no-self"
  qry="000011"
fi

if [ $jobid -eq 12 ] ; then
  blk="000003"
  slf="--no-self"
  qry="000012"
fi

if [ $jobid -eq 13 ] ; then
  blk="000004"
  slf=""
  qry="000013"
fi

if [ $jobid -eq 14 ] ; then
  blk="000004"
  slf="--no-self"
  qry="000014"
fi

if [ $jobid -eq 15 ] ; then
  blk="000004"
  slf="--no-self"
  qry="000015"
fi

if [ $jobid -eq 16 ] ; then
  blk="000004"
  slf="--no-self"
  qry="000016"
fi

if [ $jobid -eq 17 ] ; then
  blk="000005"
  slf=""
  qry="000017"
fi

if [ $jobid -eq 18 ] ; then
  blk="000005"
  slf="--no-self"
  qry="000018"
fi

if [ $jobid -eq 19 ] ; then
  blk="000005"
  slf="--no-self"
  qry="000019"
fi

if [ $jobid -eq 20 ] ; then
  blk="000005"
  slf="--no-self"
  qry="000020"
fi

if [ $jobid -eq 21 ] ; then
  blk="000006"
  slf=""
  qry="000021"
fi

if [ $jobid -eq 22 ] ; then
  blk="000006"
  slf="--no-self"
  qry="000022"
fi

if [ $jobid -eq 23 ] ; then
  blk="000006"
  slf="--no-self"
  qry="000023"
fi

if [ $jobid -eq 24 ] ; then
  blk="000006"
  slf="--no-self"
  qry="000024"
fi

if [ $jobid -eq 25 ] ; then
  blk="000007"
  slf=""
  qry="000025"
fi

if [ $jobid -eq 26 ] ; then
  blk="000007"
  slf="--no-self"
  qry="000026"
fi

if [ $jobid -eq 27 ] ; then
  blk="000007"
  slf="--no-self"
  qry="000027"
fi

if [ $jobid -eq 28 ] ; then
  blk="000007"
  slf="--no-self"
  qry="000028"
fi

if [ $jobid -eq 29 ] ; then
  blk="000008"
  slf=""
  qry="000029"
fi

if [ $jobid -eq 30 ] ; then
  blk="000008"
  slf="--no-self"
  qry="000030"
fi

if [ $jobid -eq 31 ] ; then
  blk="000008"
  slf="--no-self"
  qry="000031"
fi

if [ $jobid -eq 32 ] ; then
  blk="000008"
  slf="--no-self"
  qry="000032"
fi

if [ $jobid -eq 33 ] ; then
  blk="000009"
  slf=""
  qry="000033"
fi

if [ $jobid -eq 34 ] ; then
  blk="000009"
  slf="--no-self"
  qry="000034"
fi

if [ $jobid -eq 35 ] ; then
  blk="000009"
  slf="--no-self"
  qry="000035"
fi

if [ $jobid -eq 36 ] ; then
  blk="000009"
  slf="--no-self"
  qry="000036"
fi

if [ $jobid -eq 37 ] ; then
  blk="000010"
  slf=""
  qry="000037"
fi

if [ $jobid -eq 38 ] ; then
  blk="000010"
  slf="--no-self"
  qry="000038"
fi

if [ $jobid -eq 39 ] ; then
  blk="000010"
  slf="--no-self"
  qry="000039"
fi

if [ $jobid -eq 40 ] ; then
  blk="000010"
  slf="--no-self"
  qry="000040"
fi

if [ $jobid -eq 41 ] ; then
  blk="000011"
  slf=""
  qry="000041"
fi

if [ $jobid -eq 42 ] ; then
  blk="000011"
  slf="--no-self"
  qry="000042"
fi

if [ $jobid -eq 43 ] ; then
  blk="000011"
  slf="--no-self"
  qry="000043"
fi

if [ $jobid -eq 44 ] ; then
  blk="000011"
  slf="--no-self"
  qry="000044"
fi

if [ $jobid -eq 45 ] ; then
  blk="000012"
  slf=""
  qry="000045"
fi

if [ $jobid -eq 46 ] ; then
  blk="000012"
  slf="--no-self"
  qry="000046"
fi

if [ $jobid -eq 47 ] ; then
  blk="000012"
  slf="--no-self"
  qry="000047"
fi

if [ $jobid -eq 48 ] ; then
  blk="000012"
  slf="--no-self"
  qry="000048"
fi

if [ $jobid -eq 49 ] ; then
  blk="000013"
  slf=""
  qry="000049"
fi

if [ $jobid -eq 50 ] ; then
  blk="000013"
  slf="--no-self"
  qry="000050"
fi

if [ $jobid -eq 51 ] ; then
  blk="000013"
  slf="--no-self"
  qry="000051"
fi

if [ $jobid -eq 52 ] ; then
  blk="000013"
  slf="--no-self"
  qry="000052"
fi

if [ $jobid -eq 53 ] ; then
  blk="000014"
  slf=""
  qry="000053"
fi

if [ $jobid -eq 54 ] ; then
  blk="000014"
  slf="--no-self"
  qry="000054"
fi

if [ $jobid -eq 55 ] ; then
  blk="000014"
  slf="--no-self"
  qry="000055"
fi

if [ $jobid -eq 56 ] ; then
  blk="000014"
  slf="--no-self"
  qry="000056"
fi

if [ $jobid -eq 57 ] ; then
  blk="000015"
  slf=""
  qry="000057"
fi

if [ $jobid -eq 58 ] ; then
  blk="000015"
  slf="--no-self"
  qry="000058"
fi

if [ $jobid -eq 59 ] ; then
  blk="000015"
  slf="--no-self"
  qry="000059"
fi

if [ $jobid -eq 60 ] ; then
  blk="000015"
  slf="--no-self"
  qry="000060"
fi

if [ $jobid -eq 61 ] ; then
  blk="000016"
  slf=""
  qry="000061"
fi

if [ $jobid -eq 62 ] ; then
  blk="000016"
  slf="--no-self"
  qry="000062"
fi

if [ $jobid -eq 63 ] ; then
  blk="000016"
  slf="--no-self"
  qry="000063"
fi

if [ $jobid -eq 64 ] ; then
  blk="000016"
  slf="--no-self"
  qry="000064"
fi

if [ $jobid -eq 65 ] ; then
  blk="000017"
  slf=""
  qry="000065"
fi

if [ $jobid -eq 66 ] ; then
  blk="000017"
  slf="--no-self"
  qry="000066"
fi

if [ $jobid -eq 67 ] ; then
  blk="000017"
  slf="--no-self"
  qry="000067"
fi

if [ $jobid -eq 68 ] ; then
  blk="000018"
  slf=""
  qry="000068"
fi

if [ $jobid -eq 69 ] ; then
  blk="000018"
  slf="--no-self"
  qry="000069"
fi

if [ $jobid -eq 70 ] ; then
  blk="000018"
  slf="--no-self"
  qry="000070"
fi

if [ $jobid -eq 71 ] ; then
  blk="000019"
  slf=""
  qry="000071"
fi

if [ $jobid -eq 72 ] ; then
  blk="000019"
  slf="--no-self"
  qry="000072"
fi

if [ $jobid -eq 73 ] ; then
  blk="000019"
  slf="--no-self"
  qry="000073"
fi

if [ $jobid -eq 74 ] ; then
  blk="000020"
  slf=""
  qry="000074"
fi

if [ $jobid -eq 75 ] ; then
  blk="000020"
  slf="--no-self"
  qry="000075"
fi

if [ $jobid -eq 76 ] ; then
  blk="000020"
  slf="--no-self"
  qry="000076"
fi

if [ $jobid -eq 77 ] ; then
  blk="000021"
  slf=""
  qry="000077"
fi

if [ $jobid -eq 78 ] ; then
  blk="000021"
  slf="--no-self"
  qry="000078"
fi

if [ $jobid -eq 79 ] ; then
  blk="000021"
  slf="--no-self"
  qry="000079"
fi

if [ $jobid -eq 80 ] ; then
  blk="000022"
  slf=""
  qry="000080"
fi

if [ $jobid -eq 81 ] ; then
  blk="000022"
  slf="--no-self"
  qry="000081"
fi

if [ $jobid -eq 82 ] ; then
  blk="000022"
  slf="--no-self"
  qry="000082"
fi

if [ $jobid -eq 83 ] ; then
  blk="000023"
  slf=""
  qry="000083"
fi

if [ $jobid -eq 84 ] ; then
  blk="000023"
  slf="--no-self"
  qry="000084"
fi

if [ $jobid -eq 85 ] ; then
  blk="000023"
  slf="--no-self"
  qry="000085"
fi

if [ $jobid -eq 86 ] ; then
  blk="000024"
  slf=""
  qry="000086"
fi

if [ $jobid -eq 87 ] ; then
  blk="000024"
  slf="--no-self"
  qry="000087"
fi

if [ $jobid -eq 88 ] ; then
  blk="000024"
  slf="--no-self"
  qry="000088"
fi

if [ $jobid -eq 89 ] ; then
  blk="000025"
  slf=""
  qry="000089"
fi

if [ $jobid -eq 90 ] ; then
  blk="000025"
  slf="--no-self"
  qry="000090"
fi

if [ $jobid -eq 91 ] ; then
  blk="000025"
  slf="--no-self"
  qry="000091"
fi

if [ $jobid -eq 92 ] ; then
  blk="000026"
  slf=""
  qry="000092"
fi

if [ $jobid -eq 93 ] ; then
  blk="000026"
  slf="--no-self"
  qry="000093"
fi

if [ $jobid -eq 94 ] ; then
  blk="000026"
  slf="--no-self"
  qry="000094"
fi

if [ $jobid -eq 95 ] ; then
  blk="000027"
  slf=""
  qry="000095"
fi

if [ $jobid -eq 96 ] ; then
  blk="000027"
  slf="--no-self"
  qry="000096"
fi

if [ $jobid -eq 97 ] ; then
  blk="000027"
  slf="--no-self"
  qry="000097"
fi

if [ $jobid -eq 98 ] ; then
  blk="000028"
  slf=""
  qry="000098"
fi

if [ $jobid -eq 99 ] ; then
  blk="000028"
  slf="--no-self"
  qry="000099"
fi

if [ $jobid -eq 100 ] ; then
  blk="000028"
  slf="--no-self"
  qry="000100"
fi

if [ $jobid -eq 101 ] ; then
  blk="000029"
  slf=""
  qry="000101"
fi

if [ $jobid -eq 102 ] ; then
  blk="000029"
  slf="--no-self"
  qry="000102"
fi

if [ $jobid -eq 103 ] ; then
  blk="000029"
  slf="--no-self"
  qry="000103"
fi

if [ $jobid -eq 104 ] ; then
  blk="000030"
  slf=""
  qry="000104"
fi

if [ $jobid -eq 105 ] ; then
  blk="000030"
  slf="--no-self"
  qry="000105"
fi

if [ $jobid -eq 106 ] ; then
  blk="000030"
  slf="--no-self"
  qry="000106"
fi

if [ $jobid -eq 107 ] ; then
  blk="000031"
  slf=""
  qry="000107"
fi

if [ $jobid -eq 108 ] ; then
  blk="000031"
  slf="--no-self"
  qry="000108"
fi

if [ $jobid -eq 109 ] ; then
  blk="000031"
  slf="--no-self"
  qry="000109"
fi

if [ $jobid -eq 110 ] ; then
  blk="000032"
  slf=""
  qry="000110"
fi

if [ $jobid -eq 111 ] ; then
  blk="000032"
  slf="--no-self"
  qry="000111"
fi

if [ $jobid -eq 112 ] ; then
  blk="000032"
  slf="--no-self"
  qry="000112"
fi

if [ $jobid -eq 113 ] ; then
  blk="000033"
  slf=""
  qry="000113"
fi

if [ $jobid -eq 114 ] ; then
  blk="000033"
  slf="--no-self"
  qry="000114"
fi

if [ $jobid -eq 115 ] ; then
  blk="000033"
  slf="--no-self"
  qry="000115"
fi

if [ $jobid -eq 116 ] ; then
  blk="000034"
  slf=""
  qry="000116"
fi

if [ $jobid -eq 117 ] ; then
  blk="000034"
  slf="--no-self"
  qry="000117"
fi

if [ $jobid -eq 118 ] ; then
  blk="000034"
  slf="--no-self"
  qry="000118"
fi

if [ $jobid -eq 119 ] ; then
  blk="000035"
  slf=""
  qry="000119"
fi

if [ $jobid -eq 120 ] ; then
  blk="000035"
  slf="--no-self"
  qry="000120"
fi

if [ $jobid -eq 121 ] ; then
  blk="000036"
  slf=""
  qry="000121"
fi

if [ $jobid -eq 122 ] ; then
  blk="000036"
  slf="--no-self"
  qry="000122"
fi

if [ $jobid -eq 123 ] ; then
  blk="000037"
  slf=""
  qry="000123"
fi

if [ $jobid -eq 124 ] ; then
  blk="000037"
  slf="--no-self"
  qry="000124"
fi

if [ $jobid -eq 125 ] ; then
  blk="000038"
  slf=""
  qry="000125"
fi

if [ $jobid -eq 126 ] ; then
  blk="000038"
  slf="--no-self"
  qry="000126"
fi

if [ $jobid -eq 127 ] ; then
  blk="000039"
  slf=""
  qry="000127"
fi

if [ $jobid -eq 128 ] ; then
  blk="000039"
  slf="--no-self"
  qry="000128"
fi

if [ $jobid -eq 129 ] ; then
  blk="000040"
  slf=""
  qry="000129"
fi

if [ $jobid -eq 130 ] ; then
  blk="000040"
  slf="--no-self"
  qry="000130"
fi

if [ $jobid -eq 131 ] ; then
  blk="000041"
  slf=""
  qry="000131"
fi

if [ $jobid -eq 132 ] ; then
  blk="000041"
  slf="--no-self"
  qry="000132"
fi

if [ $jobid -eq 133 ] ; then
  blk="000042"
  slf=""
  qry="000133"
fi

if [ $jobid -eq 134 ] ; then
  blk="000042"
  slf="--no-self"
  qry="000134"
fi

if [ $jobid -eq 135 ] ; then
  blk="000043"
  slf=""
  qry="000135"
fi

if [ $jobid -eq 136 ] ; then
  blk="000043"
  slf="--no-self"
  qry="000136"
fi

if [ $jobid -eq 137 ] ; then
  blk="000044"
  slf=""
  qry="000137"
fi

if [ $jobid -eq 138 ] ; then
  blk="000044"
  slf="--no-self"
  qry="000138"
fi

if [ $jobid -eq 139 ] ; then
  blk="000045"
  slf=""
  qry="000139"
fi

if [ $jobid -eq 140 ] ; then
  blk="000045"
  slf="--no-self"
  qry="000140"
fi

if [ $jobid -eq 141 ] ; then
  blk="000046"
  slf=""
  qry="000141"
fi

if [ $jobid -eq 142 ] ; then
  blk="000046"
  slf="--no-self"
  qry="000142"
fi

if [ $jobid -eq 143 ] ; then
  blk="000047"
  slf=""
  qry="000143"
fi

if [ $jobid -eq 144 ] ; then
  blk="000047"
  slf="--no-self"
  qry="000144"
fi

if [ $jobid -eq 145 ] ; then
  blk="000048"
  slf=""
  qry="000145"
fi

if [ $jobid -eq 146 ] ; then
  blk="000048"
  slf="--no-self"
  qry="000146"
fi

if [ $jobid -eq 147 ] ; then
  blk="000049"
  slf=""
  qry="000147"
fi

if [ $jobid -eq 148 ] ; then
  blk="000049"
  slf="--no-self"
  qry="000148"
fi

if [ $jobid -eq 149 ] ; then
  blk="000050"
  slf=""
  qry="000149"
fi

if [ $jobid -eq 150 ] ; then
  blk="000050"
  slf="--no-self"
  qry="000150"
fi

if [ $jobid -eq 151 ] ; then
  blk="000051"
  slf=""
  qry="000151"
fi

if [ $jobid -eq 152 ] ; then
  blk="000051"
  slf="--no-self"
  qry="000152"
fi

if [ $jobid -eq 153 ] ; then
  blk="000052"
  slf=""
  qry="000153"
fi

if [ $jobid -eq 154 ] ; then
  blk="000052"
  slf="--no-self"
  qry="000154"
fi

if [ $jobid -eq 155 ] ; then
  blk="000053"
  slf=""
  qry="000155"
fi

if [ $jobid -eq 156 ] ; then
  blk="000054"
  slf=""
  qry="000156"
fi

if [ $jobid -eq 157 ] ; then
  blk="000055"
  slf=""
  qry="000157"
fi

if [ $jobid -eq 158 ] ; then
  blk="000056"
  slf=""
  qry="000158"
fi

if [ $jobid -eq 159 ] ; then
  blk="000057"
  slf=""
  qry="000159"
fi

if [ $jobid -eq 160 ] ; then
  blk="000058"
  slf=""
  qry="000160"
fi

if [ $jobid -eq 161 ] ; then
  blk="000059"
  slf=""
  qry="000161"
fi

if [ $jobid -eq 162 ] ; then
  blk="000060"
  slf=""
  qry="000162"
fi

if [ $jobid -eq 163 ] ; then
  blk="000061"
  slf=""
  qry="000163"
fi

if [ $jobid -eq 164 ] ; then
  blk="000062"
  slf=""
  qry="000164"
fi

if [ $jobid -eq 165 ] ; then
  blk="000063"
  slf=""
  qry="000165"
fi

if [ $jobid -eq 166 ] ; then
  blk="000064"
  slf=""
  qry="000166"
fi

if [ $jobid -eq 167 ] ; then
  blk="000065"
  slf=""
  qry="000167"
fi

if [ $jobid -eq 168 ] ; then
  blk="000066"
  slf=""
  qry="000168"
fi

if [ $jobid -eq 169 ] ; then
  blk="000067"
  slf=""
  qry="000169"
fi

if [ $jobid -eq 170 ] ; then
  blk="000068"
  slf=""
  qry="000170"
fi

if [ $jobid -eq 171 ] ; then
  blk="000069"
  slf=""
  qry="000171"
fi

if [ $jobid -eq 172 ] ; then
  blk="000070"
  slf=""
  qry="000172"
fi

if [ $jobid -eq 173 ] ; then
  blk="000071"
  slf=""
  qry="000173"
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

#  File must exist: cbs432.ms16.frequentMers.ignore.gz

echo ""
echo Running block $blk in query $qry
echo ""

if [ ! -e ./results/$qry.mhap ] ; then
  /data/apps/java/jdk1.8.0_74/bin/java -d64 -server -Xmx6144m \
    -jar  $bin/../share/java/classes/mhap-2.1.3.jar  \
    --repeat-weight 0.9 --repeat-idf-scale 10 -k 16 \
    --store-full-id \
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
    -G ../cbs432.gkpStore \
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
