#!/bin/python2 

import subprocess
from itertools import izip
from datetime import datetime

d={}
with open("seq_index_smp.txt") as f:
	for line in f:
		fline=line.split()
		seq=fline[2]
		rep=str(fline[3])
		pld=fline[4] 
		d[seq]= rep+"_"+pld

index_502_r='ATAGAGAG'
		
def skip_record():
	r1.next()
	r1.next()
	r1.next()
	r1.next()
	r2.next()
	r2.next()
	r2.next()
	r2.next()

def keep_record(fr1,fr2):
	fr1.write(r1.readline())
	fr1.write(r1.readline())
	fr1.write(r1.readline())
	fr1.write(r1.readline())

	fr2.write(r2.readline())
	fr2.write(r2.readline())
	fr2.write(r2.readline())
	fr2.write(r2.readline())

p1 = subprocess.Popen("bioawk -c fastx '{print $seq}' D130_I1.fastq.gz", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
p2 = subprocess.Popen("bioawk -c fastx '{print $seq}' D130_I2.fastq.gz", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
r1 = open('D130_R1_trim.fastq','r') 
r2 = open('D130_R2_trim.fastq','r') 

case=0
for line1,line2 in izip(iter(p1.stdout.readline,''), iter(p2.stdout.readline,'')):
	case += 1 
	#print case
	if case % 5000 == 0:
		print case,str(datetime.now())
	
	#print(line1.strip())
	#print(line2.strip())
		#print r1.readline().strip()
		#print r2.readline().strip()
		#print r2.readline().strip()
	
	if line2.strip() == index_502_r:
		seqexp = line1.strip()
		if seqexp in d:
			exp=d[seqexp]
			expR1 = open('deMx_trim/' + exp + '_R1.fastq','a')
			expR2 = open('deMx_trim/' + exp + '_R2.fastq','a')
			keep_record(expR1,expR2)
			expR1.close()
			expR2.close()
		else:
			skip_record()
	else:
		skip_record()
r1.close()
r2.close()
