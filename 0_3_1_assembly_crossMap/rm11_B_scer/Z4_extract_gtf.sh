module load hisat2
hisat2_extract_splice_sites.py rm11_B.gtf > rm11_B.splice_sites
hisat2_extract_exons.py rm11_B.gtf > rm11_B.exons 
