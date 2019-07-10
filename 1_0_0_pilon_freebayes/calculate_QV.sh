module load samtools

# calculation of T 
#samtools mpileup -f rm11_B.fasta rm11_B_nodup.bam > rm11_B.mpileup
#samtools mpileup -f yps128_5.fasta yps128_5_nodup.bam > yps128_5.mpileup 

#  from the mpileup file, find all positions that has a coverage bigger than 3. 
# cut -f4 rm11_B.mpileup | awk '$1 >3{c++} END{print c+0}'
# cut -f4 yps128_5.mpileup | awk '$1>3{c++} END{print c+0}'

grep -P '^Seg' rm11_B.vcf | cut -f4 | tr -d '["space:]' | wc -c 
grep -P '^Seg' yps128_5.vcf | cut -f4 | tr -d '[:space:]' | wc -c
