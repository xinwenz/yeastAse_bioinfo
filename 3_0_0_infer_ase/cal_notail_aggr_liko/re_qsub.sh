for i in {1..475}
do
if [ $(stat -c%s cal_notail_aggr_liko.Rscript.R.e1623793.$i) -gt 5000 ]; then
	echo $i
	qsub -q jje,pub8i,pub64,bio -t $i cal_notail_aggr_liko.Rscript.R
fi
done
