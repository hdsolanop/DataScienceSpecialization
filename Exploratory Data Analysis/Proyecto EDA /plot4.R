##Plot 4
setwd("~/GitHub/DataScienceSpecialization/Exploratory Data Analysis/Proyecto EDA ")
##Loading libraries 
library(dplyr)
library(ggplot2)
## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Summarizing the data
joint <- inner_join(NEI,SCC, by = "SCC")
temp <- joint %>% filter(grepl("*Coal",Short.Name) & grepl("*Comb",Short.Name)) %>% group_by(year) %>% summarize(sum = sum(Emissions))
##Open png graphics device
png(filename = "plot4.png")
##Ploting
ggplot(data = temp, aes(x = year, y = sum)) + geom_point() + geom_line() + xlab("Year") + ylab("Total Emissions") + ggtitle("Total Emissions of Coal related sources in the US")
##Close graphics device
dev.off()