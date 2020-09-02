for i in {401..500}
do
if [ ! -f  cal_agrg_yps_liko_${i}.RData ]; then
	#echo cal_arrg_yps_liko_$i.RData
	qsub -q jje -t $i cal_notail_aggr_liko.Rscript.R
fi
done
