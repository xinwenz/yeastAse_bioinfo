#!/bin/bash
#$ -N backupToEvolGen
#$ -q ionode

rsync  -e "ssh -c arcfour" --ignore-errors -v --update --recursive --times --links --exclude "*~" *.[gtp]* xinwenz@evolgen.bio.uci.edu:/volume1/homes/xinwenz/yeastAssembly/lumData

