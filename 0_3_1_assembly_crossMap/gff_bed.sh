module load bedtools
#bedtools intersect -wa -wb -b yps128_5scer/yps128_5.gff -a yps128_5_snp.bed | grep -P '\tgene\t' > yps_5.gene
#awk 'match($0, /Name=\w*/) {print $1"\t"$3"\t"substr($0,RSTART+5,RLENGTH-5)}'  yps_5.gene > yps128_5_snp_geneName.be

grep -P '\tgene\t' yps128_5scer/yps128_5.gff | awk 'match($0, /Name=\w*/) {print $1"\t"$4"\t"$5"\t"substr($0,RSTART+5,RLENGTH-5)}' > tmp1.bed  

awk -v OFS='\t' '{print $1,$2,$2}' yps128_5_snpls_u293 > tmp2.bed 

bedtools intersect -wa -wb -b tmp1.bed -a tmp2.bed | cut -f1,2,7 > yps128_5_snp_gene.txt

rm tmp1.bed 
rm tmp2.bed
