#bioawk -c gff '{if ( == mRNA) print -bash}' yps128_9.gff > yps128_9_transcripts.gff
bioawk -c gff '{if($3 == "gene") print $0}' yps128_9.gff > yps128_9_gene.gff
