# Input is one pileup file, this program is to count how much in ref seq and how much is the alt seq... 
# the out put format should be by_allle.pilecount 
# pilecount is a good suffix 
# standard output 
# usage: python reportCount.py yps_raw.pileup > yps.pilecount 
import sys

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


def count_allele(s):
	s = s.lower()
	ref_count = s.count('.') + s.count(',')
	mydict =  {}	
	mydict['a'] = s.count('a')
	mydict['c'] = s.count('c') 
	mydict['t'] = s.count('t')
	mydict['g'] = s.count('g')
	mydict['del'] = s.count('*')
	if all(value == 0 for value in mydict.values()): # it's possible '..,,' there is no alt reads info..
		alt_type = None
		alt_count = 0 
	else:
		alt_type = max(mydict,key=mydict.get)
		alt_count = mydict[alt_type]
		alt_type = alt_type.upper()
	res = [ref_count,alt_type,alt_count]
	return res
	
f1 = open(sys.argv[1],'r')
print 'chrom\tposit\tcvrg\tref\trefC\talt\taltC'
for line in f1:
	tmpls = line.rstrip().split()
	chrom = tmpls[0]
	posit = tmpls[1]
	coverage = int(tmpls[3])
	ref = tmpls[2].upper()
	info = count_allele(rmplus(tmpls[4])) if coverage > 0 else [0,None,0] # if total counts is 0, than there will be a empty string there, so set refcount == 0, alt as None, alt count as 0 
	refCount = info[0]
	alt = info[1]
	altCount = info[2]
	print '%s\t%s\t%s\t%s\t%s\t%s\t%s'%(chrom,posit,coverage,ref,refCount,alt,altCount)

	
	
