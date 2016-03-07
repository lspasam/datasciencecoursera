add2 <- function(x,y){
  x+y
}

above10 <- function(x){
  use <- x > 10
  x[use]
}

above <- function(x, n=12){
  use <- x > n
  x[use]
}

columnmean <- function(y){
  
  numCol = ncol(y) #number of columns
  means = numeric(numCol) #create a vector for all the means
  
  for(i in 1:numCol){
    means[i] <- mean(y[, 1])
    
  }
  
  
}