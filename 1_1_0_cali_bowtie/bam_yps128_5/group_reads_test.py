import sys
import numpy as np

def reviseSt(x):
	newstr = ''
	i=0
	while i < len(x):
		if x[i].isdigit():
			i += int(x[i])
			newstr = newstr[:-1] + "X"
		elif x[i] == "^":
			i += 1
		elif x[i] == "$":
			i += 0
		else:
			newstr = newstr + x[i]
		i += 1 
	return newstr


def findrefPos(s):
    return [i for i, letter in enumerate(s) if (letter == ',' or letter == '.')]


f1 = open(sys.argv[1],'r')
gN_store = 0
for line in f1:
	tmpls = line.rstrip().split()
	gN = int(tmpls[0])
	cv = int(tmpls[3])
	
	## make sure the coverage matches positons and names 
	cv_st_o = tmpls[4]
	cv_st = reviseSt(tmpls[4])
	cv_name = np.array(tmpls[6].split(','))
#	if not (cv == len(cv_st) and cv == len(tmpls[5].split(',')) and cv == len(cv_name)) : 
#		raise Exception('coverage not match')
	
#	if gN != gN_store :
#		if gN_store > 0:
#			print gN_store,len(pool)
#		pool = set([])
#		pool = pool |  set(cv_name[findrefPos(cv_st)])
#	else:
#		pool = pool | set(cv_name[findrefPos(cv_st)])
	#print cv == cv_st 
	print '%s\t%s\t%s\t%s\t%s'%(gN,cv,cv_st_o,cv_st,len(findrefPos(cv_st)))
#	gN_store = gN
#print gN, len(pool)
f1.close()
