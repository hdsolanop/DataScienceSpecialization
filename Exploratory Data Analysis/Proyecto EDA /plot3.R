##Plot 3
setwd("~/GitHub/DataScienceSpecialization/Exploratory Data Analysis/Proyecto EDA ")
##Loading libraries 
library(dplyr)
library(ggplot2)
## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Summarizing the data
joint <- inner_join(NEI,SCC, by = "SCC")
temp <- joint %>% filter(fips == "24510") %>% group_by(year,type) %>% summarize(sum = sum(Emissions))
##Open png graphics device
png(filename = "plot3.png")
##Ploting
ggplot(data = temp, aes(x = year, y = sum, color = type)) + geom_point() + geom_line() + xlab("Year") + ylab("Total Emissions") + ggtitle("Total Emissions per type in Baltimore City")
##Close graphics device
dev.off()