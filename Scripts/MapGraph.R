# Map Script! 
library(dplyr)
library(plotly)
library(plyr)
library(tidyr)
#Set Working Directory:
setwd("~/Documents/Spring2017/INFO201/final/info-201-final-project/Scripts")

data.set.month <- read.csv("../data/Marijuana_Use_Past_Month.csv") 
data.set.year <-  read.csv("../data/Marijuana_Use_Past_Year.csv")

is.data.frame(data.set.month)
is.data.frame(data.set.year)

View(data.set.month)
View(data.set.year)

#create new column with no percent sign so we can calculate values
updated.month.data <- mutate(data.set.month, percents = extract_numeric(Small..Area.Estimate))

#Organize percentages smoked by State
avg.data <- ddply(updated.month.data, .(State), summarize, percents = mean(percents))
View(avg.data)

