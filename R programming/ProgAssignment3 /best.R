best <- function(state, outcome) {
        library(stats)
        ## Read outcome data
        Out_name <- c("heart attack","heart failure","pneumonia")
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        ## Check that state and outcome are valid
        US_states <- unique(data[,7])
        check_out <- is.element(outcome,Out_name)
        check_state <- is.element(state,US_states)
        hospital_name <- character(0)
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
                                data <- data[complete.cases(data),1:46]
                                data <- data[data[,7]== state,1:46]
                                min <- min(data[,11])
                                index <- data[,11] == min
                                temp <- data[index,2]
                                temp <- sort(temp)
                                hospital_name <- temp[1]
                        }else{
                                if(outcome == Out_name[2]){
                                        data[,17] <- as.numeric(data[,17])
                                        data <- data[complete.cases(data),1:46]
                                        data <- data[data[,7] == state,1:46]
                                        min <- min(data[,17])
                                        index <- data[,17] == min
                                        temp <- data[index,2]
                                        temp <- sort(temp)
                                        hospital_name <- temp[1]
                                }else{
                                        if(outcome == Out_name[3]){
                                                data[,23] <- as.numeric(data[,23])
                                                data <- data[complete.cases(data),1:46]
                                                data <- data[data[,7]== state,1:46]
                                                min <- min(data[,23])
                                                index <- data[,23] == min
                                                temp <- data[index,2]
                                                temp <- sort(temp)
                                                hospital_name <- temp[1] 
                                        }
                                }
                        }
                        
                }
        }
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        hospital_name
}