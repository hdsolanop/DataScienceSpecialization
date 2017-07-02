library(dplyr)
library(lubridate)
##change working directory to produce and save the plot
setwd("~/GitHub/DataScienceSpecialization/Exploratory Data Analysis/ExData_Plotting1/myplots")
##Importing the dataset to R
dataset <- read.table("household_power_consumption.txt",header = TRUE,sep=";", na.strings = "?")
##Chaning date columns to date datatype
dataset <- mutate(dataset, DATE = dmy_hms(paste(Date,Time))) %>%
        filter(DATE > dmy("01/02/2007") & DATE < dmy("03/02/2007"))

##Open png graphics device
png(filename = "plot3.png")
##make the plot
plot(dataset$Sub_metering_1 ~ dataset$DATE, type = "n", ylab="Energy sub metering",xlab = "")
##Annotate the plot with the lins for the sub_metering values
lines(dataset$DATE,dataset$Sub_metering_1)
lines(dataset$DATE,dataset$Sub_metering_2,col= "red")
lines(dataset$DATE,dataset$Sub_metering_3,col= "blue")
##Add the legend
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd = 1)
dev.off()