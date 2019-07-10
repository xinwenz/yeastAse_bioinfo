#!/bin/bash
#$ -N backupToEvolGen
#$ -q ionode

rsync  -e "ssh -c arcfour" --ignore-errors -v --update --recursive --times --links --exclude "*~" *.[gt]* xinwenz@evolgen.bio.uci.edu:/volume1/homes/xinwenz/ASEexpression_raw/DNA_cali/

