#!/bin/bash
module load bowtie/1.0.0 
#module load perl/5.26.1
#bowtie-build yps128_5_seg.fa yps128_5_seg
#bowtie-build rm11_B_seg.fa rm11_B_seg

#gzip -d -c ../0express/deMx_fixed_zero/9_C_r1.fq.gz > ../0express/deMx_fixed_zero/9_C_r1.fq 
#gzip -d -c ../0express/deMx_fixed_zero/9_C_r2.fq.gz > ../0express/deMx_fixed_zero/9_C_r2.fq

# only absolute path works

~/software/ASAP_v0.1.2/ASAP --genome_1 /dfs1/bio/xinwenz/nnp/1exp0map/refG/ --index_1 /dfs1/bio/xinwenz/nnp/1exp0map/refG/yps128_5_seg --genome_2 /dfs1/bio/xinwenz/nnp/1exp0map/refG/ --index_2 /dfs1/bio/xinwenz/nnp/1exp0map/refG/rm11_B_seg -1 /dfs1/bio/xinwenz/nnp/0express/deMx_fixed_zero/9_C_r1.fq -2 /dfs1/bio/xinwenz/nnp/0express/deMx_fixed_zero/9_C_r2.fq 

 
