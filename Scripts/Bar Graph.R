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

# Bar Graph of Usage Frequencies
# myData <- data
# myData$se <- myData$x.sd / sqrt(myData$x.n)
# 
# colnames(myData) <- c("cyl", "gears", "mean", "sd", "n", "se")
# 
# myData$names <- c(paste(myData$cyl, "cyl /",
#                         myData$gears, " gear"))
# 
# par(mar = c(5, 6, 4, 5) + 0.1)
# 
# plotTop <- max(myData$mean) +
#   myData[myData$mean == max(myData$mean), 6] * 3
# 
# barCenters <- barplot(height = myData$mean,
#                       names.arg = myData$names,
#                       beside = true, las = 2,
#                       ylim = c(0, plotTop),
#                       cex.names = 0.75, xaxt = "n",
#                       main = "Mileage by No. Cylinders and No. Gears",
#                       ylab = "Miles per Gallon",
#                       border = "black", axes = TRUE)
# 
# # Specify the groupings. We use srt = 45 for a
# # 45 degree string rotation
# text(x = barCenters, y = par("usr")[3] - 1, srt = 45,
#      adj = 1, labels = myData$names, xpd = TRUE)
# 
# segments(barCenters, myData$mean - myData$se * 2, barCenters,
#          myData$mean + myData$se * 2, lwd = 1.5)
# 
# arrows(barCenters, myData$mean - myData$se * 2, barCenters,
#        myData$mean + myData$se * 2, lwd = 1.5, angle = 90,
#        code = 3, length = 0.05)
