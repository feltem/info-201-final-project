# Map Script! 
library(dplyr)
library(plotly)
library(plyr)
library(tidyr)
#Set Working Directory:
#setwd("~/Documents/Spring2017/INFO201/final/info-201-final-project/Scripts")

#function for building a map
BuildMap <- function(avg.data){
  l <- list(color = toRGB("White"), width = 2 )
  
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  AvgMonthYear <- plot_geo(avg.data, locationmode = 'USA-states') %>%
    add_trace(
<<<<<<< HEAD
      z = ~stuff, locations = ~Abbreviation,
=======
      z = ~percents, locations = ~Abbreviation,
>>>>>>> 0732e7e6271683df04ec3b79791e3dd67aba5a41
      color = ~percents, colors = 'Greens'
    ) %>%
    colorbar(title = "% Weed Smoked") %>%
    layout(
      title = 'Weed Smoked in America',
      geo = g
    )
  
  return(AvgMonthYear)
}

