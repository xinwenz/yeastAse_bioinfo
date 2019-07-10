for i in {1..10}
	do
	cd /dfs3/bio/xinwenz/nnp/1aseInfer/hpc_null_nostr_p$i
	a=$(echo "($i-1) * 1750 + 1" | bc)
	b=$(echo "$i * 1750" | bc) 
	qsub -q abio,abio128,jje,jje128,bio,pub8i,epyc,free16i,free24i,free32i,free40i -t $a-$b rep_null.Rscript.R
	done 
