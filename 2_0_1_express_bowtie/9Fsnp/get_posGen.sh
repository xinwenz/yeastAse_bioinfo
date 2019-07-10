#awk '{print $1"\t"$2-1"\t"$2}' rm11_F.snpls > rm11_F_snpls.bed
#awk '{print $1"\t"$2-1"\t"$2}' yps128_9.snpls > yps128_9_snpls.bed
#bedtools intersect -a rm11_F_snpls.bed -b rm11_F_transcripts.gff -wa -wb > rm11_F_snpGene.agff

#bedtools intersect -a yps128_9_snpls.bed -b yps128_9_transcripts.gff -wa -wb > yps128_9_snpmRNA.agff

bedtools intersect -a yps128_9_snpls.bed -b yps128_9_gene.gff -wa -wb > yps128_9_snpGene.agff
#awk 'match($12,/Dbxref=[a-zA-Z0-9\:]+/) {print $1"\t"$3"\t"substr(2,RSTART+7,RLENGTH-7)}' rm11_F_snpGene.agff > rm11_F_posit_gene.txt

#awk 'match($12,/Dbxref=[a-zA-Z0-9\:]+/) {print $1"\t"$3"\t"substr($12,RSTART+7,RLENGTH-7)}' yps128_9_snpmRNA.agff > yps128_9_posit_mRNA.txt 

awk 'match($0,/Name=[a-zA-Z0-9\_]+/) {print $1"\t"$3"\t"substr($0,RSTART+5,RLENGTH-5)}' yps128_9_snpGene.agff > yps128_9_posit_gene.txt
