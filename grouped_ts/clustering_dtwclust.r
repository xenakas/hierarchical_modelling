library(cluster)

    data = read.csv(file="/home/xenakas/Desktop/Git/hierarchical_modelling/data/rus/rus_vrp_ind.csv", header = TRUE, sep = ",")
    #data <- subset(data, X!= 0)
    data$X <- NULL
    dim(data)
    
    data[is.na(data)] <- 0
    
    library(TSclust)
      
    D3 <- diss(data[,1:20], "DTWARP")
    D3[50:60]  
    
    diss_mat_dtw  <- matrix(NA, nrow = dim(data[,1:20])[2], ncol = dim(data[,1:20])[2])
    
    i=1
    j=1
    a=1
    while (i < dim(data[,1:20])[2]){
      
      for (j in (i+1):dim(data[,1:20])[2]){ 
        # cat("(", j, i, ")")
        diss_mat_dtw[j,i] <-  D3[a]
        a <- a+1
        }
      i <-i+1
      }
    
    diss_mat_dtw
    
    D3
    
    
    
    
    # d2 <- diss(data, "EUCL")
      
    

