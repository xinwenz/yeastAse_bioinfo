#!/bin/python2 

import subprocess
from itertools import izip

index_701="CACTTGA"
index_702="CCGGAAT"
index_703="TAGACCG"
index_704="GTATCTC"
index_705="GCTATAG"
index_706="TTCCGTC"
index_707="AGAGTGC"
index_708="CGTTCTT"
index_709="TTCGACG"
index_710="ACCAGCA"
index_711="GGAATGT"
index_712="CGATGGA"
index_713="AATCGAC"
index_714="GATGACT"
index_715="ATGCATG"
index_716="TCGCCAA"
index_717="GAATAGG"
index_718="GGCATAC"
index_719="TTGTCCA"
index_720="AGTCGCA"
index_721="TCGCAGT"
index_722="CACGTTC"
index_723="CCTAGAT"
index_724="ATAGCTG"
index_725="GCTGTCA"
index_726="ACGTGAG"
index_727="CAATCTG"
index_728="ATTAGGC"
index_729="GAACCGT"
index_730="TTGGTAC"
index_731="CGCCATT"
index_732="TGCAACA"
index_733="GACTCTA"
index_734="CTCTACT"
index_735="CATCTTG"
index_736="CGAGTAG"
index_737="ATGCGCT"
index_738="TGGAGAC"
index_739="TGTCCGA"
index_740="AACTCCT"
index_741="GTAACGA"
index_742="GTACGAC"
index_743="CCTAAGG"
index_744="TCCGTTG"
index_745="GGTGGTT"
index_746="AAGTAGC"
index_747="TCAGACA"
index_748="ACGATAC"
index_501="TAGATCGC"
index_502="CTCTCTAT"
index_503="TATCCTCT"
index_505="CACTTGAT"
index_506="CCGGAATT"
index_507="TAGACCGT"


def skip_record():
	r1.readline()
	r1.readline()
	r1.readline()
	r1.readline()
	r2.readline()
	r2.readline()
	r2.readline()
	r2.readline()

def keep_record(fr1,fr2):
	fr1.write(r1.readline())
	fr1.write(r1.readline())
	fr1.write(r1.readline())
	fr1.write(r1.readline())

	fr2.write(r2.readline())
	fr2.write(r2.readline())
	fr2.write(r2.readline())
	fr2.write(r2.readline())

p1 = subprocess.Popen("bioawk -c fastx '{print $seq}' Undetermined_S0_L001_I1_001.fastq.gz", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
p2 = subprocess.Popen("bioawk -c fastx '{print $seq}' Undetermined_S0_L001_I2_001.fastq.gz", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

#rm11 index701,index501
#cbs432 index 702,index501
#yps128 index 703, index 501

r1 = open('Undetermined_S0_L001_R1_001.fastq','r') 
r2 = open('Undetermined_S0_L001_R2_001.fastq','r') 
rm11_r1 = open('rm11_r1.fastq','w') 
rm11_r2 = open('rm11_r2.fastq','w') 
cbs432_r1 = open('cbs432_r1.fastq','w') 
cbs432_r2 = open('cbs432_r2.fastq','w') 
yps128_r1 = open('yps128_r1.fastq', 'w')
yps128_r2 = open('yps128_r2.fastq','w') 
	
for line1,line2 in izip(iter(p1.stdout.readline,''), iter(p2.stdout.readline,'')):
	#print(line1.strip())
	#print(line2.strip())
		#print r1.readline().strip()
		#print r2.readline().strip()
		#print r2.readline().strip()
	if line2.strip() == index_501:
		if line1.strip() == index_701:
			keep_record(rm11_r1,rm11_r2)
		elif line1.strip() == index_702:
			keep_record(cbs432_r1,cbs432_r2)
		elif line1.strip() == index_703:
			keep_record(yps128_r1,yps128_r2)
		else:
			skip_record()
	else:
		skip_record()
r1.close()
r2.close()
rm11_r1.close()
rm11_r2.close()
cbs432_r1.close()
cbs432_r2.close()
yps128_r1.close()
yps128_r2.close()

