for f in $(ls -v ./blat_joblist.sh.e4038172.*)
do 
	line=$(head -n 1 $f)
	if ! [[ $line =~ ^Got\ [0-9]+\ lifts\ in\ query.lft$ ]]
		then echo $line $f
			mv $f stout_error
	else mv $f stout/
	fi
done
