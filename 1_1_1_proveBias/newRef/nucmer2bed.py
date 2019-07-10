import sys

f = open(sys.argv[1],'r')
lines = f.readlines()[5:]

for l in lines:
	info = l.strip().split()
# first strain chm and position 
	#pos = int(info[0])
	#chm = info[13]

# second strain chm and position
	pos = int(info[3])
	chm = info[14]
# 0-based
	#print "%s\t%d\t%d"%(chm,pos-1,pos)
# 1- based
	print "%s\t%d\t%d"%(chm,pos,pos)

f.close()



