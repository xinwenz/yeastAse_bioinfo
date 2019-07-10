bioawk -c fastx 'BEGIN{allbase=0} {allbase+=length()} END{print allbase}' cbs432.fastq
