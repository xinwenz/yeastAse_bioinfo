import sys

f = open(sys.argv[1],'r')
lines = f.readlines()[5:]

print "ref1Chom\tref1Posit\tref2Chom\tref2Posit\tdrct"
for l in lines:
	info = l.strip().split()
# first strain chm and position 
	pos1 = int(info[0])
	chm1 = info[13]
	drct = info[12]
# second strain chm and position
	pos2 = int(info[3])
	chm2 = info[14]
# 0-based
	#print "%s\t%d\t%d"%(chm,pos-1,pos)
# 1- based position 
	print "%s\t%d\t%s\t%d\t%s"%(chm1,pos1,chm2,pos2,drct)

f.close()



