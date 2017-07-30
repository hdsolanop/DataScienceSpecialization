##Plot 2
setwd("~/GitHub/DataScienceSpecialization/Exploratory Data Analysis/Proyecto EDA ")
##Loading libraries 
library(dplyr)
## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Summarizing the data
temp <- NEI %>% filter(fips == "24510") %>% group_by(year) %>% summarize(sum = sum(Emissions))
##Open png graphics device
png(filename = "plot2.png")
##Ploting
plot(temp$year, temp$sum, type="n", main="Baltimore City - Total Emissions per year",xlab = "Year", ylab = "Total Emissions")
lines(temp$year, temp$sum)
points(temp$year, temp$sum)
##Close graphics device
dev.off()