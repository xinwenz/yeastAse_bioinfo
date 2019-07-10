#!/bin/bash
#$ -N extract_tgz

# tar -xvzf will interprete multiple files wrong
for file in $(ls *.tgz)
do
	folder=$( basename $file .tgz)
	mkdir $folder
	tar -xzf $file -C ./$folder/
done
rm *.tgz
