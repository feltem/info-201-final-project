# Setup
library(dplyr)
library(ggplot2)
# install.packages('readxl')
library(readxl)

# Combine Datasets
first.use <- read.csv('~/Documents/INFO 201/info-201-final-project/Data/First_Use_Marijuana.csv')
first.avg <- mean(as.numeric(gsub("%", "", as.character(first.use[,4]))))

past.month <- read.csv('~/Documents/INFO 201/info-201-final-project/Data/Marijuana_Use_Past_Month.csv')
month.avg <- mean(as.numeric(gsub("%", "", as.character(past.month[,4]))))

past.year <- read.csv('~/Documents/INFO 201/info-201-final-project/Data/Marijuana_Use_Past_Year.csv')
year.avg <- mean(as.numeric(gsub("%", "", as.character(past.year[,4]))))

risk.perceptions <- read.csv('~/Documents/INFO 201/info-201-final-project/Data/Marijuana_Risk_Perceptions.csv')
risk.avg <- mean(as.numeric(gsub("%", "", as.character(risk.perceptions[,4]))))

my.data <- full_join(past.month, past.year, by = 'Order', suffix = c('.month', '.year')) %>% 
           full_join(y = risk.perceptions, by = 'Order', suffix = c('past', '.risk')) %>% 
           full_join(y = first.use, by = 'Order', suffix = c('.risk', '.first'))

graph <- geom_histogram(mapping = NULL, data = my.data, stat = "bin",
                        position = "stack", binwidth = NULL, bins = NULL, na.rm = FALSE,
                        show.legend = NA, inherit.aes = TRUE)
count <- data.frame(c(first.avg, month.avg, year.avg, risk.avg))
ggplot(count, aes(x = c.first.avg..month.avg..year.avg..risk.avg.)) +
     geom_bar()