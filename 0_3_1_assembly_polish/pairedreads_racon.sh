# code get lost
# it's to add :1 to the name of r1 forward reads
# add :2 to the name of r2 reverse reads

bioawk -c fastx '{print @:1nn+n}' ../0short/rm11_r1_trm.fastq
