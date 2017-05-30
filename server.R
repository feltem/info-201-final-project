# server.r 
library(shiny)

setwd("C:/Users/Julia/Desktop/Info201/info-201-final-project")

marijuana.laws <- read.csv('./Data/legal_marijuana_support.csv', stringsAsFactors = FALSE)
source('./scripts/Timeline.R')

shinyServer(function(input, output) { 
  
  
  
  
  
  
  
  ##Timeline with Widgit 
  output$timeline <- renderPlotly({ 
    return(BuildTimeline(marijuana.laws, input$yvar))
  }) 
    
})
