#Timeline of Marijuana laws by state

library(dplyr)
library(plotly)
library(ggplot2)

#setwd("C:/Users/Julia/Desktop/Info201/info-201-final-project/scripts")

#marijuana.laws <- read.csv('../Data/legal_marijuana_support.csv', stringsAsFactors = FALSE)

BuildTimeline <- function(data, yvar){
  
  var.equation <- paste0('~', yvar)
  
  timeline <- plot_ly(data=data, x = ~Year, line = list(color = 'rgb(58, 95, 11)'),
          y = eval(parse(text = var.equation)),
          type = 'scatter', mode = 'lines+markers')%>%
    layout(title = "National Views on Marijuana Legalization (1969-2016)")
  
  
  
  return(timeline)
}


