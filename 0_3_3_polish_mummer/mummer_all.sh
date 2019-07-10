module load perl/5.16.2
module load MUMmer 

#nucmer -p rm11_nuc /dfs1/bio/xinwenz/refGen/scer_R64_all.fa rm11_F.fasta
#nucmer -p yps_nuc /dfs1/bio/xinwenz/refGen/scer_R64_all.fa yps128_9.fasta

nucmer -p yps5_nuc /dfs1/bio/xinwenz/refGen/scer_R64_all.fa yps128_5.fasta
