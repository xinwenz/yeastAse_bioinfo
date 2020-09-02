for i in {0001..2850}
do
	if [ ! -f calh_notail_liko_${i}.RData ]; then
		echo $i
		qsub -q pub8i -t $i calh_notail_lklhratio.Rscript.R
	fi
done
