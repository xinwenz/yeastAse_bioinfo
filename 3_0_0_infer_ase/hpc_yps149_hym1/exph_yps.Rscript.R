#!/bin/bash
#$ -ckpt restart

margs=$(head -n $SGE_TASK_ID exph_ypsRM14A9A_hpc_com_hym1.txt | tail -n 1) 
module load R/3.5.1 
Rscript -<<EOF $margs

load("hpc_need_Feb4.RData") # likelihood functions,paraGetB/BB,expi,cali,expi_Ct,cali_Ct  
require("foreach")
require("iterators")
library("bbmle")

myargs <- commandArgs(trailingOnly = T)
num <- myargs[1]
sp_i <- as.integer(myargs[2:length(myargs)])
spPart1 <- sp_i[1:(length(sp_i)/2)]
spPart2 <- sp_i[(length(sp_i)/2+1) : length(sp_i)]

######################################### define which data frame and coverage vector to use 
orig <- exph
orig_Ct <- exph_Ct_esum
f <- "exph_ypsRM14A9A_esum"
######################################################
x_key <- names(orig_Ct)[spPart1]
y_key <- names(orig_Ct)[spPart2]

ans1 <- foreach(d=iter(orig,by="row"),
                .combine=rbind,
                .packages='bbmle') %do%
  paraGetBB(d,x_key,y_key,orig_Ct)
colnames(ans1) <- c("log.ecis","ecisL","ecisH","log.rHy","rHyL","rhyH")
rownames(ans1) <- orig[,1]
ans1 <- data.frame(ans1)

ans2 <- foreach(d=iter(orig,by="row"),
                .combine=rbind,
                .packages='bbmle') %do%
  paraGetB(d,x_key,y_key,orig_Ct)
colnames(ans2) <- c("B.log.ecis","B.ecisL","B.ecisH")
rownames(ans2) <- orig[,1]
ans2 <- data.frame(ans2)

ans3 <- cbind(ans1,ans2)

vn <- paste0(f,'_',num)
assign(x=vn,value=ans3)

save(list = vn,file=paste0(f,"_",num,".RData"))

EOF
