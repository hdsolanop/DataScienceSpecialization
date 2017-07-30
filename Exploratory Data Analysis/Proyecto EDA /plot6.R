##Plot 6
setwd("~/GitHub/DataScienceSpecialization/Exploratory Data Analysis/Proyecto EDA ")
##Loading libraries 
library(dplyr)
library(ggplot2)
## Loading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# Summarizing the data
joint <- inner_join(NEI,SCC, by = "SCC")
tempB <- joint %>% filter(grepl("*[Mm]otor",Short.Name) & grepl("*[Vv]ehicle",Short.Name) & fips == "24510") %>% group_by(year,fips) %>% summarize(sum = sum(Emissions))
tempLA <- joint %>% filter(grepl("*[Mm]otor",Short.Name) & grepl("*[Vv]ehicle",Short.Name) & fips == "06037") %>% group_by(year,fips) %>% summarize(sum = sum(Emissions))
temp <- rbind(tempB,tempLA) 
city <- case_when(temp$fips == "24510" ~ "Baltimore City", temp$fips == "06037" ~ "Los Angeles")
temp$city <- city
##Open png graphics device
png(filename = "plot6.png")
##Ploting
ggplot(data = temp, aes(x = year, y = sum, color = city)) + geom_point() + geom_line() + xlab("Year") + ylab("Total Emissions") + ggtitle("Total Emissions of motor vehicle sources")
##Close graphics device
dev.off()