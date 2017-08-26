library(tidyverse)
library(RColorBrewer)
setwd("~/GitHub/DataScienceSpecialization/Reproducible Research/Week 1")
payments <- read_csv("payments.csv")
##Selecting a color palette with six levels
cols<-brewer.pal(n=6,name="Accent")
d <- t(col2rgb(cols))
cols <- paste0(rgb(d,maxColorValue = 255),"50")
par(mfrow = c(3,2),mar = c(3,2,2,1))
##limits for x and y axis in the plots
xmax <- max(payments$Average.Covered.Charges)
xmin <- min(payments$Average.Covered.Charges)
xlim <- c(xmin,xmax)
ymax <- max(payments$Average.Total.Payments)
ymin <- min(payments$Average.Total.Payments)
ylim <- c(ymin,ymax)
##Filtering the data to make the first plot
temp <- filter(payments, Provider.State == "CA")
cols_drg <- character(length(temp$DRG.Definition))
for(i in 1:length(temp$DRG.Definition)) cols_drg[i] <- switch(temp$DRG.Definition[i],"194 - SIMPLE PNEUMONIA & PLEURISY W CC" = cols[1],"292 - HEART FAILURE & SHOCK W CC" = cols[2], "392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC" = cols[3], "641 - MISC DISORDERS OF NUTRITION,METABOLISM,FLUIDS/ELECTROLYTES W/O MCC" = cols[4], "690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC" = cols[5], "871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC" = cols[6])
plot(temp$Average.Covered.Charges,temp$Average.Total.Payments, col=cols_drg, pch = 19, xlab = "Mean Covered Charges (USD)", ylab = "Mean Total Payments (USD)",main = "1.Relationship between Mean covered charges and Mean total payments in California",ylim = ylim, xlim = xlim)
##Filtering the data to make the second plot
temp <- filter(payments, Provider.State == "FL")
for(i in 1:length(temp$DRG.Definition)) cols_drg[i] <- switch(temp$DRG.Definition[i],"194 - SIMPLE PNEUMONIA & PLEURISY W CC" = cols[1],"292 - HEART FAILURE & SHOCK W CC" = cols[2], "392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC" = cols[3], "641 - MISC DISORDERS OF NUTRITION,METABOLISM,FLUIDS/ELECTROLYTES W/O MCC" = cols[4], "690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC" = cols[5], "871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC" = cols[6])
plot(temp$Average.Covered.Charges,temp$Average.Total.Payments, col=cols_drg, pch = 19, xlab = "Mean Covered Charges (USD)", ylab = "Mean Total Payments (USD)",main = "2.Relationship between Mean covered charges and Mean total payments in Florida",ylim = ylim, xlim = xlim)
##Filtering the data to make the third plot
temp <- filter(payments, Provider.State == "IL")
for(i in 1:length(temp$DRG.Definition)) cols_drg[i] <- switch(temp$DRG.Definition[i],"194 - SIMPLE PNEUMONIA & PLEURISY W CC" = cols[1],"292 - HEART FAILURE & SHOCK W CC" = cols[2], "392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC" = cols[3], "641 - MISC DISORDERS OF NUTRITION,METABOLISM,FLUIDS/ELECTROLYTES W/O MCC" = cols[4], "690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC" = cols[5], "871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC" = cols[6])
plot(temp$Average.Covered.Charges,temp$Average.Total.Payments, col=cols_drg, pch = 19, xlab = "Mean Covered Charges (USD)", ylab = "Mean Total Payments (USD)",main = "3.Relationship between Mean covered charges and Mean total payments in Illinois",ylim = ylim, xlim = xlim)
##Filtering the data to make the fourth plot
temp <- filter(payments, Provider.State == "NY")
for(i in 1:length(temp$DRG.Definition)) cols_drg[i] <- switch(temp$DRG.Definition[i],"194 - SIMPLE PNEUMONIA & PLEURISY W CC" = cols[1],"292 - HEART FAILURE & SHOCK W CC" = cols[2], "392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC" = cols[3], "641 - MISC DISORDERS OF NUTRITION,METABOLISM,FLUIDS/ELECTROLYTES W/O MCC" = cols[4], "690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC" = cols[5], "871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC" = cols[6])
plot(temp$Average.Covered.Charges,temp$Average.Total.Payments, col=cols_drg, pch = 19, xlab = "Mean Covered Charges (USD)", ylab = "Mean Total Payments (USD)" ,main = "4.Relationship between Mean covered charges and Mean total payments in Florida",ylim = ylim, xlim = xlim)
##Filtering the data to make the fifth plot
temp <- filter(payments, Provider.State == "PA")
for(i in 1:length(temp$DRG.Definition)) cols_drg[i] <- switch(temp$DRG.Definition[i],"194 - SIMPLE PNEUMONIA & PLEURISY W CC" = cols[1],"292 - HEART FAILURE & SHOCK W CC" = cols[2], "392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC" = cols[3], "641 - MISC DISORDERS OF NUTRITION,METABOLISM,FLUIDS/ELECTROLYTES W/O MCC" = cols[4], "690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC" = cols[5], "871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC" = cols[6])
plot(temp$Average.Covered.Charges,temp$Average.Total.Payments, col=cols_drg, pch = 19, xlab = "Mean Covered Charges (USD)", ylab = "Mean Total Payments (USD)" ,main = "5.Relationship between Mean covered charges and Mean total payments in Pennsylvania",ylim = ylim, xlim = xlim)
##Filtering the data to make the sixth plot
temp <- filter(payments, Provider.State == "TX")
for(i in 1:length(temp$DRG.Definition)) cols_drg[i] <- switch(temp$DRG.Definition[i],"194 - SIMPLE PNEUMONIA & PLEURISY W CC" = cols[1],"292 - HEART FAILURE & SHOCK W CC" = cols[2], "392 - ESOPHAGITIS, GASTROENT & MISC DIGEST DISORDERS W/O MCC" = cols[3], "641 - MISC DISORDERS OF NUTRITION,METABOLISM,FLUIDS/ELECTROLYTES W/O MCC" = cols[4], "690 - KIDNEY & URINARY TRACT INFECTIONS W/O MCC" = cols[5], "871 - SEPTICEMIA OR SEVERE SEPSIS W/O MV 96+ HOURS W MCC" = cols[6])
plot(temp$Average.Covered.Charges,temp$Average.Total.Payments, col=cols_drg, pch = 19, xlab = "Mean Covered Charges (USD)", ylab = "Mean Total Payments (USD)" ,main = "6.Relationship between Mean covered charges and Mean total payments in Texas",ylim = ylim, xlim = xlim)

dev.copy2pdf()