#sp22_i <- sample(1:44,22)

############ receive parameters from command line ########### 
load("../hpc_need.RData")
require("foreach")
require("iterators")
library("bbmle")


myargs <- commandArgs(trailingOnly = T)
num <- myargs[1]
lev <- 0.95

sp_i <- as.integer(myargs[2:length(myargs)])
spPart1 <- sp_i[1:(length(sp_i)/2)]
spPart2 <- sp_i[(length(sp_i)/2+1) : length(sp_i)]

x_key <- names(smp_C)[spPart1]
y_key <- names(smp_C)[spPart2]

#print(num)
#print(sp_i)
#print(x_key)
#print(y_key)

ans1 <- foreach(d=iter(exp_fine4,by="row"),
				.combine=rbind,
				.packages='bbmle') %do%
	paraGetBB(d,x_key,y_key,smp_C)
colnames(ans1) <- c("log.ecis","ecisL","ecisH","log.rHy","rHyL","rhyH")
rownames(ans1) <- exp_fine4$ypsTript
ans1 <- data.frame(ans1)
vn1 <- paste0('ttrue95_',num)
assign(x=vn1,value=ans1)

ans2 <- foreach(d=iter(exp_fine4,by="row"),
				.combine=rbind,
				.packages='bbmle') %do%
	paraGetB(d,x_key,y_key,smp_C)

colnames(ans2) <- c("log.ecis","ecisL","ecisH")
rownames(ans2) <- exp_fine4$ypsTript
ans2 <- data.frame(ans2)
vn2 <- paste0('btrue95_',num)
assign(x=vn2,value=ans2)

save(list = ls(pattern='[tb]true95*'),file=paste0("true95_",num,".RData"))
