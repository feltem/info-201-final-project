# Setup
library(dplyr)
library(plotly)
# install.packages('readxl')
library(readxl)

# Past Month Manipulation
past.month <- read.csv('./Data/Marijuana_Use_Past_Month.csv')
month.avg <- round(mean(as.numeric(gsub("%", "", as.character(past.month[,4])))))
month.confidence <- month.avg - round(mean(as.numeric(gsub("%", "", as.character(past.month[,5])))))

# Past Year Manipulation
past.year <- read.csv('./Data/Marijuana_Use_Past_Year.csv')
year.avg <- round(mean(as.numeric(gsub("%", "", as.character(past.year[,4])))))
year.confidence <- year.avg - round(mean(as.numeric(gsub("%", "", as.character(past.year[,5])))))

# Risk Perception Manipulation
risk.perceptions <- read.csv('./Data/Marijuana_Risk_Perceptions.csv')
risk.avg <- round(mean(as.numeric(gsub("%", "", as.character(risk.perceptions[,4])))))
risk.confidence <- risk.avg - round(mean(as.numeric(gsub("%", "", as.character(risk.perceptions[,5])))))

# Interactive Plotly Graph
BuildBar <- function(data) {
  plot <- plot_ly(
                  x = c("Past Month", "Past Year", "Percieved Risk Average"),
                  y = c(month.avg, year.avg, risk.avg),
                  type = "bar", 
                  error_y = ~list(value = c(month.confidence, year.confidence, risk.confidence),
                                  color = '#000000'),
                  marker = list(color = c('rgb(140,0,26)', 'rgb(140,0,26)', 'rgb(169,169,169)'), width = 1.5, 
                                line = list(color = 'rgb(169,169,169)'))) %>% 
          layout(title = "Marijuana Usage & Risk",
                 xaxis = list(title = "Marijuana Usage"),
                 yaxis = list(title = "Percent"))
  return(plot)
}
                    