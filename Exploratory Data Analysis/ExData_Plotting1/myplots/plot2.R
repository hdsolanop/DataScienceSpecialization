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
png(filename = "plot2.png")
##make the plot
plot(dataset$Global_active_power ~dataset$DATE, type= "l", xlab= "", ylab = "Global Active Power (Kilowatts)")
dev.off()