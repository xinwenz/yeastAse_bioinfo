import glob,re,os
def pirChange(x):
	if x == "R1":
		return "R1"
	elif x == "R2":
		return "I1"
	elif x == "R3":
		return "I2"
	elif x == "R4":
		return "R2"
	else:
		return "Unknown"
	
for file in glob.glob("*.fastq.gz"):	
	m1 = re.match(r'\w+',file)
	smp = m1.group(0)
	m2 = re.search(r'run\d',file)
	runN =  m2.group()
	m3= re.search(r'R\d',file)
	pir =  m3.group()
	
	newname = smp + '_' + runN + '_' + pirChange(pir) + '.fastq.gz'
	print newname
	os.rename(file,newname)
	
	
