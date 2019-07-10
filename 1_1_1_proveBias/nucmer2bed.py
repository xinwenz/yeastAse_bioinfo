import sys

f = open(sys.argv[1],'r')
lines = f.readlines()[5:]

res1 = open("ref1.snpls","w")
res2 = open("ref2.snpls","w")

for l in lines:
	info = l.strip().split()
# first strain chm and position 
	pos1 = int(info[0])
	chm1 = info[13]

# second strain chm and position
	pos2 = int(info[3])
	chm2 = info[14]
# 0-based
	#print "%s\t%d\t%d"%(chm,pos-1,pos)
# 1- based position 
	res1.write( "%s\t%d\n"%(chm1,pos1))
	res2.write( "%s\t%d\n"%(chm2,pos2))

f.close()
res1.close()
res2.close()



