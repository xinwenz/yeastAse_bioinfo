#!/bin/bash
#$ -N findSNP

module load MUMmer/3.23
nucmer --mum -p yps_rm_nucmer yps128_oldref.fasta rm11_oldref.fasta
show-snps -Clr yps_rm_nucmer.delta > yps_rm.snps
