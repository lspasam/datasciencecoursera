complete <- function(directory, id = 1:332){
  retDataFrame <- data.frame(id=numeric(), nobs=numeric())
  for(i in id){
    path <- paste(directory,"/",formatC(i, width=3, flag=0),".csv", sep="")
    dataFrame <- read.csv(file=path, colClasses = c("NULL", "numeric", "numeric", "NULL"))
    nobs <- sum(!is.na(dataFrame$sulfate) & !is.na(dataFrame$nitrate))
    retDataFrame <- rbind(retDataFrame, data.frame(id=i, nobs=nobs))
  }
  
  retDataFrame
}