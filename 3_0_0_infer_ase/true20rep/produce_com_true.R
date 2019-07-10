for (j in seq(2,10,by=1)) {

	for(i in 1:20) {
	tmp <- sample(1:20,j*2) # null both yps compare 
	cat(c(paste0("yy_",formatC(j, width = 2, format = "d", flag = "0"),"_",formatC(i, width = 2, format = "d", flag = "0")),tmp,'\n'))
}
}

for (j in seq(2,20,by=1)) {
	
	for(i in 1:20) {
		tmp_y <- sample(1:20,j)
		tmp_r <- sample(21:40,j)  # null both yps compare 
		cat(c(paste0("yr_",formatC(j, width = 2, format = "d", flag = "0"),"_",formatC(i, width = 2, format = "d", flag = "0")),tmp_y,tmp_r,'\n'))
	}
}
