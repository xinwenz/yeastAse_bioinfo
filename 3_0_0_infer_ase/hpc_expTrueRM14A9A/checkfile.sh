for i in {0001..2700}
do 
	if [ ! -f exph_trueRM14A9A_esum_${i}.RData ]
	then qsub -t $i -q abio128 exph_true.Rsrcipt.R
	fi
done
