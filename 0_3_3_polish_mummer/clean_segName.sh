#perl -pe 's/>[^\$]*$/">rmSeg" . ++$n ."\n"/ge' ../polish0assembly1/rm11_F.fasta > ./rm11_F.fasta

#perl -pe 's/>[^\$]*$/">ypsSeg" . ++$n ."\n"/ge' ../polish0assembly1/yps128_9.fasta >./yps128_9.fasta

perl -pe 's/>[^\$]*$/">ypsSeg" . ++$n ."\n"/ge' ../quiver0pilon3/yps128_5.fasta >./yps128_5.fasta
