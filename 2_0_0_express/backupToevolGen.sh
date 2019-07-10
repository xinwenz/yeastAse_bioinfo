#!/bin/bash
#$ -N backupToEvolGen
#$ -q ionode

rsync  -e "ssh -c arcfour" --ignore-errors -v --update --recursive --times --links --exclude "*~" *trim*.gz xinwenz@evolgen.bio.uci.edu:/volume1/homes/xinwenz/ASEexpression_raw/RNA_expr/


rsync  -e "ssh -c arcfour" --ignore-errors -v --update --recursive --times --links --exclude "*~" *I[12]*.gz xinwenz@evolgen.bio.uci.edu:/volume1/homes/xinwenz/ASEexpression_raw/RNA_expr/


rsync  -e "ssh -c arcfour" --ignore-errors -v --update --recursive --times --links --exclude "*~" *.tsv xinwenz@evolgen.bio.uci.edu:/volume1/homes/xinwenz/ASEexpression_raw/RNA_expr/
