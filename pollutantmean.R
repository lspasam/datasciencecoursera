pollutantmean <- function(directory, pollutant, id = 1:332){
  paths<- vector("list", length(id))
  
  #add all filenames to a list
  pathIdx = 1;
  for(i in id){
    path <- paste(directory,"/",formatC(i, width=3, flag=0),".csv", sep="")
    paths[pathIdx] <- path
    pathIdx <- pathIdx + 1
  }
  
  datalist <- if( pollutant == 'sulfate'){
    lapply(paths, function(x){read.csv(file=x, colClasses = c("NULL", "numeric", "NULL", "NULL"))})
  }else{
    lapply(paths, function(x){read.csv(file=x, colClasses = c("NULL", "NULL", "numeric", "NULL"))})
  }
  
  data <- Reduce(function(df1,df2) { rbind(df1, df2) }, datalist)
  mean(data[[1]], na.rm=TRUE)
  
}

