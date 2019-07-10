s = 'k+2ff+3rrrty'

def rmplus(x):  # this function remvoes insertion read counts from pileup string. 
	ele = x.split('+')
	i=1
	newFinal = ele[0]
	while i < len(ele):
		#print i
		insertLen = int(ele[i][0]) # how long is this insertion
		#print insertLen
		#print ele[i]
		newStr = ele[i][insertLen+1:]
 		#print newStr
		newFinal = newFinal + newStr
		i += 1 
	return newFinal

print rmplus(s)	
