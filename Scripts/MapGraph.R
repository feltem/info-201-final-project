# Map Script! 
library(dplyr)
library(plotly)
library(plyr)
library(tidyr)
#Set Working Directory:
#setwd("~/Documents/Spring2017/INFO201/final/info-201-final-project/Scripts")
data.set.month <- read.csv("./Data/Marijuana_Use_Past_Month.csv") 
data.set.year <-  read.csv("./Data/Marijuana_Use_Past_Year.csv")

is.data.frame(data.set.month)
is.data.frame(data.set.year)


#create new column with no percent sign so we can calculate values
updated.month.data <- mutate(data.set.month, percents = extract_numeric(Small..Area.Estimate))
View(updated.month.data)
updated.year.data <- mutate(data.set.year, percents = extract_numeric(Small..Area.Estimate))

#Organize percentages smoked by State
avg.month.data <- ddply(updated.month.data, .(State), summarize, percents = mean(percents), code)
View(avg.month.data)
avg.year.data <- ddply(updated.year.data, .(State), summarize, percents = mean(percents))


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
      z = ~percents, text = ~percents, locations = ~State,
      color = ~percents, colors = 'Greens'
    ) %>%
    colorbar(title = "Week Smoked") %>%
    layout(
      title = 'Weed Smoked in America',
      geo = g
    )
  
  return(AvgMonthYear)
}

