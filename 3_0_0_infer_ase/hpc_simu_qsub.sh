for i in {1,4,8,c}
do
	cd /dfs3/bio/xinwenz/nnp/3_0_0_infer_ase/hpc_simu_p$i
	qsub -q abio,abio128,bio,jje,jje128,pub8i,epyc,free88i simu_null.Rscript.R
done
