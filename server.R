# server.r 
library(shiny)

#setwd("C:/Users/Julia/Desktop/Info201/info-201-final-project")

marijuana.laws <- read.csv('./data/legal_marijuana_support.csv', stringsAsFactors = FALSE)
source('./Scripts/Timeline.R')
source('./Scripts/MapGraph.R')
source('./Scripts/Bar Graph.R')

##Dominicks data manipulation. 
data.set.month <- read.csv("./data/Marijuana_Use_Past_Month.csv") 
data.set.year <-  read.csv("./data/Marijuana_Use_Past_Year.csv")
states.data <- read.csv("./data/States.csv")
is.data.frame(data.set.month)
is.data.frame(data.set.year)
is.data.frame(states.data)
View(states.data)
# Create new column with no percent sign so we can calculate values
updated.month.data <- mutate(data.set.month, percents = extract_numeric(Small..Area.Estimate))

updated.year.data <- mutate(data.set.year, percents = extract_numeric(Small..Area.Estimate))

# Organize percentages smoked by State
avg.month.data <- ddply(updated.month.data, .(State), summarize, percents = mean(percents))

avg.year.data <- ddply(updated.year.data, .(State), summarize, percents = mean(percents))

shinyServer(function(input, output) { 

  # Map  with Widget
  output$AvgMonthYear <- renderPlotly({
    if(input$var == "Month"){
      avg.data <- avg.month.data
    } else{
      avg.data <- avg.year.data
    }
    
    return(BuildMap(avg.data))
  })
  
  # Timeline with Widgit 
  output$timeline <- renderPlotly({ 
    return(BuildTimeline(marijuana.laws, input$yvar))
  }) 
  # Bar Graph without Widget
  output$plot <- renderPlotly({
    return(BuildBar(data.set.month))
  })
})
