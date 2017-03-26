corr <- function(directory, treshold = 0){
        ##'directory' is a character vector of length 1 indication
        ## the location of the csv
        
        ## 'treshold' is a numeric vector of length 1 indication the
        ## number of completely observed observations (on all 
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        ## NOTE: do not round the result!
        
        library(readr,stats)
        id <- 1:332
        comp <- complete(directory,id)
        filtered <- id [comp$nobs >= treshold]
        dir <- getwd()
        result  <- vector(mode = "numeric")
        cont <- 1
        setwd(directory)
        for(i in filtered){
                if(nchar(i) == 1){
                        f <- paste("00",toString(i),".csv", sep = "")
                } else if(nchar(i) == 2){
                        f <- paste("0",toString(i),".csv", sep = "")
                } else {
                        f <- paste(toString(i),".csv", sep = "")     
                }
                
                temp <-  read.csv(f,header = TRUE, colClasses = c("Date","numeric","numeric","numeric"))
                
                result[cont] <- cor(temp$sulfate, temp$nitrate, use = "pairwise.complete.obs")
                cont <- cont + 1
                i <- i + 1
        }
        setwd(dir)
        result[!is.na(result)]
}