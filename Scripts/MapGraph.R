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
      z = ~percents, locations = ~Abbreviation,
      color = ~percents, colors = 'Greens'
    ) %>%
    colorbar(title = "Week Smoked") %>%
    layout(
      title = 'Weed Smoked in America',
      geo = g
    )
  
  return(AvgMonthYear)
}

