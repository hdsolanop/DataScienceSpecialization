rankhospital <- function(state, outcome, num = "best") {
        library(stats)
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        Out_name <- c("heart attack","heart failure","pneumonia")
        ## Check that state and outcome are valid
        US_states <- unique(data[,7])
        check_out <- is.element(outcome,Out_name)
        check_state <- is.element(state,US_states)
        ## Return hospital name in that state with the given rank
        if(check_out == FALSE){
                if(check_state == FALSE){
                        stop(paste("invalid outcome and state"))
                }else{
                        stop(paste("invalid outcome"))
                }
        }else{
                if(check_state == FALSE){
                        stop(paste("invalid state"))
                }else{
                        if(outcome == Out_name[1]){
                                data[,11] <- as.numeric(data[,11])
                                data <- data[complete.cases(data),1:11]
                                data <- data[data[,7]== state,1:11]
                                data <- data[,c(2,11)]
                                data <- data[order(data[,1]),]
                        }else{
                                if(outcome == Out_name[2]){
                                        data[,17] <- as.numeric(data[,17])
                                        data <- data[complete.cases(data),1:17]
                                        data <- data[data[,7]== state,1:17]
                                        data <- data[,c(2,17)]
                                        data <- data[order(data[,1]),]
                                        
                                }else{
                                        if(outcome == Out_name[3]){
                                                data[,23] <- as.numeric(data[,23])
                                                data <- data[complete.cases(data),1:23]
                                                data <- data[data[,7]== state,1:23]
                                                data <- data[,c(2,23)]
                                                data <- data[order(data[,1]),]
                                        }
                                }
                        }
                        
                }
        }
        ##getting the desired rank
        if(num == "best"){
                data <- data[order(data[,2]),]
                min <- min(data[,2])
                index <- data[,2] == min
                temp <- data[index,1]
                hospital_name <- temp[1]
        }else if(num == "worst"){
                data <- data[order(-data[,2]),]
                max <- max(data[,2])
                index <- data[,2] == max
                temp <- data[index,1]
                hospital_name <- temp[1]
        }else if( num > nrow(data)){
                        hospital_name <- NA
        }else {
                data <- data[order(data[,2]),]
                rank <- data[,2][num]
                hospital_name <- data[,1][num]
        }
        ## 30-day death rate
        hospital_name
}