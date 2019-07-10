# Input is one pileup file, this program is to count how many in ref seq and how many in the alt seq... 
# the out put format should be by_allle.pilecount 
# usage: python2 count_pileup.py yps_raw.pileup > yps.pilecount 
# output format: chrom,posit,ref,refcount,alt,altcount 

import sys

def scanForNumber(x):
    newstr = ''
    i = 0
    while i < len(x):
        if x[i].isdigit():
            i += int(x[i])
        elif x[i] == "^":
            i += 1
        else:
            newstr = newstr + x[i]
        i += 1
    return newstr

def count_allele(s):
	s = s.lower()
	mydict =  {}	
	mydict['a'] = s.count('a')
	mydict['c'] = s.count('c') 
	mydict['t'] = s.count('t')
	mydict['g'] = s.count('g')
	mydict['del1'] = s.count('*') + s.count('>') + s.count('<')
	mydict['del2'] = s.count('-')
	mydict['ist'] = s.count('+')
	if all(value == 0 for value in mydict.values()): # it's possible '..,,' there is no alt reads info..
		alt_type = None
		alt_count = 0 
	else:
		alt_type = max(mydict,key=mydict.get)
		alt_count = mydict[alt_type]
		alt_type = alt_type.upper()
	
	ref_count = s.count('.') + s.count(',') - mydict['ist'] - mydict['del2']
	res = [ref_count,alt_type,alt_count]
	return res
	
f1 = open(sys.argv[1],'r')
print 'chrom\tposit\tref\trefC\talt\taltC'
for line in f1:
	tmpls = line.rstrip().split()
	chrom = tmpls[0]
	posit = tmpls[1]
	coverage = int(tmpls[3])
	ref = tmpls[2].upper()
	info = count_allele(scanForNumber(tmpls[4])) if coverage > 0 else [0,None,0] # if total counts is 0, than there will be a empty string there, so set refcount == 0, alt as None, alt count as 0 
	refCount = info[0]
	alt = info[1]
	altCount = info[2]
	print '%s\t%s\t%s\t%s\t%s\t%s'%(chrom,posit,ref,refCount,alt,altCount)

	
	
