#!/bin/bash

module load MUMmer/3.23

ref1="scer_R64_all"
ref2="yps128_5"

prefx=${ref1}_${ref2}

nucmer --mum -p ${prefx}_nucmer /dfs3/bio/xinwenz/nnp/1_1_0_cali_bowtie/genoms/${ref1}.fasta /dfs3/bio/xinwenz/nnp/1_1_0_cali_bowtie/genoms/${ref2}.fasta
