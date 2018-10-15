#This is the server code for a shiny web app that use the open dataset from: https://www.datos.gov.co/Estad-sticas-Nacionales/Hist-rico-de-personas-desmovilizadas/rjrr-368x
#The dataset has 3 columns: department, year and the number of demobilized people
#The usir will be able to chose which departments and a year interval to filter the dataset
#then a visualization and a table are generated.
#The plot shows also the trend using the loess model

library(shiny)
library(tidyverse)
dataset <- read_csv("dataset.csv") %>% filter( Departamento != "ARCHIPIELAGO DE SAN ANDRES PROVIDENCIA Y SANTA CATALINA")
names(dataset) <- c("deparment", "year", "number_people")


# Define server logic required to show time series of the demobilized people
#for each selected department
shinyServer(function(input, output) {
    
    #Filter dataset in order to include only the selected departments and years' interval
    temp <- reactive({ dataset %>% filter(deparment %in% input$departmentInput, 
                                year >= input$yearInput[1],  
                                year <= input$yearInput[2]) %>%
                    #We can order the datase a little to ease the reading
                                arrange(year) %>%
                                arrange(deparment)
    })
    
  output$Cool_plot <- renderPlot({
      # Plot a time series per department
        ggplot(data = temp(), aes(x = year, y = number_people, color = deparment)) + 
                geom_line() + 
                geom_smooth(method = "loess") + ylab("Number of people demobilized")
    
  })
  
  output$Cool_table <- renderTable({
      #Show the filtered dataset
        temp()
  })
  
})
