pollutantmean <- function(directory, pollutant, id = 1:332){
        ##'directory' is a character vector of length 1 indication
        ## the location of the csv
        
        ##'pollutant' is a character vector of length 1 indicating
        ##the name of the pollutant for which we wil calculate the
        ## mean; either "sulfate" of "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        library(readr)
        dir <- getwd()
        setwd(directory)
        y <- vector()
        for(i in id) {
                if(nchar(i) == 1){
                        f <- paste("00",toString(i),".csv", sep = "")
                } else if(nchar(i) == 2){
                        f <- paste("0",toString(i),".csv", sep = "")
                } else {
                        f <- paste(toString(i),".csv", sep = "")     
                }
                
                temp <-  read.csv(f,header = TRUE, colClasses = c("Date","numeric","numeric","numeric"))
                y <- c(y, temp[pollutant][,1][!is.na(temp[pollutant][,1])])
                i <- i + 1
        }
        setwd(dir)
        x <- mean(y)
        x
        ##Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        ## NOTE: Do not round the result!
}