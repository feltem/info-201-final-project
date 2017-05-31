# server.r 
library(shiny)
library(dplyr)
#setwd("C:/Users/Julia/Desktop/Info201/info-201-final-project")
marijuana.laws <- read.csv('./data/legal_marijuana_support.csv', stringsAsFactors = FALSE)
source('./Scripts/Timeline.R')
source('./Scripts/MapGraph.R')
source('./Scripts/Bar Graph.R')

# Map data manipulation. 
data.set.month <- read.csv("./data/Marijuana_Use_Past_Month.csv") 
data.set.year <-  read.csv("./data/Marijuana_Use_Past_Year.csv")
states.data <- read.csv("./data/States.csv")
legalization.status <- read.csv("./Data/state_marijuana_laws_10_2016.csv")

# Create new column with no percent sign so we can calculate values
updated.month.data <- mutate(data.set.month, percents = extract_numeric(Small..Area.Estimate))
updated.year.data <- mutate(data.set.year, percents = extract_numeric(Small..Area.Estimate))

# Organize percentages smoked by State
avg.month.data <- ddply(updated.month.data, .(State), summarize, percents = mean(percents))
new.avg.month.data <- merge(avg.month.data, states.data, by = "State")

avg.year.data <- ddply(updated.year.data, .(State), summarize, percents = mean(percents))
new.avg.year.data <- merge(avg.year.data, states.data, by = "State")

# Number of states that have legalized medical marijuana
legalized.medical <- legalization.status %>% filter(Medical.marijuana.legalized == 'Yes') %>% select(Medical.marijuana.legalized, State)
num.legalized.medical <- nrow(legalized.medical)

# Number of states that have legalized rec marijuana
legalized.rec <- legalization.status %>% filter(Marijuana.legalized.for.recreational.use == 'Yes') %>% select(Marijuana.legalized.for.recreational.use, State)
num.legalized.rec <- nrow(legalized.rec)

# Number of states with no laws on marijuana
no.laws <- legalization.status %>% filter(No.laws.legalizing.marijuana == 'Yes') %>% select(No.laws.legalizing.marijuana, State)
num.no.laws <- nrow(no.laws)

#############

shinyServer(function(input, output) { 
  
  # Map with Widget
  output$AvgMonthYear <- renderPlotly({
    if(input$var == "Month"){
      avg.data <- new.avg.month.data
    } else{
      avg.data <- new.avg.year.data
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
  
### All text outputs
  output$introinfo <- renderText({
    paragraph <- paste0("As of 2016, there are currently ", num.legalized.medical, " states that have legalized medical marijuana, ", num.legalized.rec, " states
                        that have legalized recreational marijuana, and ", num.no.laws, " states with no laws on the legalization of marijuana.")
    return(paragraph)
  })
})
