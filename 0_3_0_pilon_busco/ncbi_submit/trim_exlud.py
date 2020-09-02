import sys

# yps128
#badseg=["Seg13","Seg14","Seg15","Seg16","Seg17","Seg18","Seg19","Seg20"]
#revise1=["Seg1", 1447047,1448086]
#revise2=["Seg10", 458181, 458971]

#rm11
#badseg=[]
#revise1=["Seg1",1436043, 1436833]
#revise2=["Seg999", 0,0]

# cbs432_1 
badseg=["Seg15"]
revise1=["Seg12",330493,330655,337464,337626]
revise2=["Seg2", 4940,5102,11864,12026]

#cbs432_2
#badseg=["Seg15"]
#revise1=["Seg12", 337464, 337626]
#revise2=["Seg2", 11864, 12026]

f = open(sys.argv[1],'r')
flines = f.readlines()
f.close()

seqs = []
l = 0
flag=False
posit1=0
posit2=0
 
while l < len(flines):
	tmp = flines[l].rstrip() 
	if tmp.startswith(">"):
		chrom = tmp[1:]
		if chrom in badseg:
			#print('del',chrom)
			l += 2
			continue
		elif chrom == revise1[0]:
			#print('spl',chrom)
			flag=True
			posit1 = revise1[1]
			posit2 = revise1[2]
			posit3 = revise1[3]
			posit4 = revise1[4]
		elif chrom == revise2[0]:
			#print('spl',chrom)
			flag=True
			posit1 = revise2[1]
			posit2 = revise2[2]
			posit3 = revise2[3]
			posit4 = revise2[4]
		else:
			#print(chrom)
			flag=False
	else:
	#	print(flag)
		if flag == False:
			seqs.append(tmp)	
		else: 				
	#		print('processed')
			seqs.append(tmp[0:posit1-1])
			seqs.append(tmp[posit2: posit3-1])
			seqs.append(tmp[posit4:])
	l += 1 

for i in range(len(seqs)):
	print(">Seg",i+1,sep='')
	print(seqs[i])

