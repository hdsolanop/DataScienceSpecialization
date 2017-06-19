rankall <- function(outcome, num = "best") {
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        Out_name <- c("heart attack","heart failure","pneumonia")
        hospital <- character(0)
        ## Check that outcome are valid
        state <- unique(data[,7])
        check_out <- is.element(outcome,Out_name)
        if(check_out == FALSE){
                stop(paste("invalid outcome"))
        } else{
                if(outcome == Out_name[1]){
                        data[,11] <- as.numeric(data[,11])
                        data <- data[complete.cases(data),c(2,7,11)]
                        data <- data[order(data[,1]),]
                        for(i in state){
                                temp <- data[data[,2] == i,c(1:3)]
                                temp <- temp[order(temp[,3]),]
                                ##getting the desired rank
                                if(num == "best"){
                                        hospital <- append(hospital,temp[1,1])
                                }else if(num == "worst"){
                                        hospital <- append(hospital, temp[length(temp[,1]),1])
                                }else if( num > nrow(data)){
                                        hospital <- append(hospital,NA)
                                }else {
                                        hospital <- append(hospital, temp[num,1])
                                }
                        }
                }else{
                        if(outcome == Out_name[2]){
                                data[,17] <- as.numeric(data[,17])
                                data <- data[complete.cases(data),c(2,7,17)]
                                data <- data[order(data[,1]),]
                                for(i in state){
                                        temp <- data[data[,2] == i,c(1:3)]
                                        temp <- temp[order(temp[,3]),]
                                        ##getting the desired rank
                                        if(num == "best"){
                                                hospital <- append(hospital,temp[1,1])
                                        }else if(num == "worst"){
                                                hospital <- append(hospital, temp[length(temp[,1]),1])
                                        }else if( num > nrow(data)){
                                                hospital <- append(hospital,NA)
                                        }else {
                                                hospital <- append(hospital, temp[num,1])
                                        }
                                }
                        }else{
                                if(outcome == Out_name[3]){
                                        data[,23] <- as.numeric(data[,23])
                                        data <- data[complete.cases(data),c(2,7,23)]
                                        data <- data[order(data[,1]),]
                                        for(i in state){
                                                temp <- data[data[,2] == i,c(1:3)]
                                                temp <- temp[order(temp[,3]),]
                                                ##getting the desired rank
                                                if(num == "best"){
                                                        hospital <- append(hospital,temp[1,1])
                                                }else if(num == "worst"){
                                                        hospital <- append(hospital, temp[length(temp[,1]),1])
                                                }else if( num > nrow(data)){
                                                        hospital <- append(hospital,NA)
                                                }else {
                                                        hospital <- append(hospital, temp[num,1])
                                                }
                                        }
                                }
                        }
                }
                }
        ## For each state, find the hospital of the given rank
        result <- data.frame(hospital,state,row.names = US_states)
        result <- result[order(result[,2]),]
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
        result
}