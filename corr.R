source("complete.R")
corr <- function(directory, threshold = 0){
  paths = list.files(path=directory, pattern="*.csv", full.names=TRUE)
  
  dataframes = complete(directory);
  dataframes.ids = dataframes[which(dataframes$nobs > threshold),"id"]
  correlations <- vector()
  
  for(id in dataframes.ids){
    path <- paste(directory,"/",formatC(id, width=3, flag=0),".csv", sep="")
    dataframe <- read.csv(file=path, colClasses = c("NULL", "numeric", "numeric", "NULL"))
    correlations <-  c(correlations,cor(dataframe$sulfate, dataframe$nitrate, use="pairwise.complete.obs"))
  }
  correlations
}