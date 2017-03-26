complete <- function(directory, id = 1:332){
        ##'directory' is a character vector of length 1 indication
        ## the location of the csv

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        library(readr)
        dir <- getwd()
        setwd(directory)
        nobs <- vector(mode = "numeric",length = length(id))
        obs <- vector(mode = "logical")
        cont <- 1
        
        for(i in min(id):max(id)) {
                if(nchar(i) == 1){
                        f <- paste("00",toString(i),".csv", sep = "")
                } else if(nchar(i) == 2){
                        f <- paste("0",toString(i),".csv", sep = "")
                } else {
                        f <- paste(toString(i),".csv", sep = "")     
                }
                
                temp <-  read.csv(f,header = TRUE, colClasses = c("Date","numeric","numeric","numeric"))
                j <- 1
                obs <- vector(mode = "logical")
                while(j < length(temp$sulfate)){
                        obs[j] <- !is.na(temp$sulfate[j]) && !is.na(temp$nitrate[j])
                        j <- j +1
                }
                nobs[cont] <- sum(obs) 
                cont <- cont + 1
                i <- i + 1
        }
        setwd(dir)
        data.frame(id,nobs)
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1   117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
}