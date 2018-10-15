#This is the UI code for a shiny web app that use the open dataset from: https://www.datos.gov.co/Estad-sticas-Nacionales/Hist-rico-de-personas-desmovilizadas/rjrr-368x
#The dataset has 3 columns: department, year and the number of demobilized people
#The usir will be able to chose which departments and a year interval to filter the dataset
#then a visualization and a table are generated.
#The plot shows also the trend using the loess model

library(shiny)
library(tidyverse)
dataset <- read_csv("dataset.csv") %>% filter( Departamento != "ARCHIPIELAGO DE SAN ANDRES PROVIDENCIA Y SANTA CATALINA")
names(dataset) <- c("deparment", "year", "number_people")
# Define UI for application that draws a histogram
shinyUI(fluidPage(
    #Add a title to the Panel
        titlePanel("Number of demobilized people in Colombia"),
    #Set up de layout
        sidebarLayout(
            sidebarPanel("Please choose a year interval and a deparment",
                         #Create a slider input for the year interval
                         sliderInput("yearInput", "Year", min = 2001, max = 2018,
                                     value = c(2010, 2018)),
                         #Create a input for the deparment
                         selectInput("departmentInput","Department",choices = unique(dataset$deparment), selected = c("BOGOTA D.C.","ANTIOQUIA"),multiple = TRUE)
                         ),
            #This is the results panel
            mainPanel("Data and trend line using the local regression model (loess)",
                #Plot output showing a lineplot with year on the x axis and number of people in the y axis
                    plotOutput("Cool_plot"),
                #Table output showing a filtered version of the dataset
                    tableOutput("Cool_table")
                      )
            )
    
    )
)
