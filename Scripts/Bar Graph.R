# Setup
library(dplyr)
# install.packages('readxl')
library(readxl)

# Combine Datasets
first.use <- read_excel('~/Documents/INFO 201/info-201-final-project/Data/FIRST USE OF MARIJUANA.xlsx') %>% 
             select(1, 4:6)
past.month <- read_excel('~/Documents/INFO 201/info-201-final-project/Data/MARIJUANA USE IN PAST MONTH.xlsx') %>% 
              select(1, 4:6)
past.year <- read_excel('~/Documents/INFO 201/info-201-final-project/Data/MARIJUANA USE IN PAST YEAR.xlsx') %>% 
             select(1, 4:6)
risk.perceptions <- read_excel('~/Documents/INFO 201/info-201-final-project/Data/SMOKING MARIJUANA RISKS PERCEPTIONS.xlsx') %>% 
             select(1, 4:6)
month.year <- full_join(past.month, past.year, by = 'Order', suffix = c('.month', '.year'))
first.risk <- full_join(first.use, risk.perceptions, by = 'Order', suffix = c('.first', '.risk'))

# Bar Graph of Usage Frequencies
myData <- 
myData$se <- myData$x.sd / sqrt(myData$x.n)

colnames(myData) <- c("cyl", "gears", "mean", "sd", "n", "se")

myData$names <- c(paste(myData$cyl, "cyl /",
                        myData$gears, " gear"))

par(mar = c(5, 6, 4, 5) + 0.1)

plotTop <- max(myData$mean) +
  myData[myData$mean == max(myData$mean), 6] * 3

barCenters <- barplot(height = myData$mean,
                      names.arg = myData$names,
                      beside = true, las = 2,
                      ylim = c(0, plotTop),
                      cex.names = 0.75, xaxt = "n",
                      main = "Mileage by No. Cylinders and No. Gears",
                      ylab = "Miles per Gallon",
                      border = "black", axes = TRUE)

# Specify the groupings. We use srt = 45 for a
# 45 degree string rotation
text(x = barCenters, y = par("usr")[3] - 1, srt = 45,
     adj = 1, labels = myData$names, xpd = TRUE)

segments(barCenters, myData$mean - myData$se * 2, barCenters,
         myData$mean + myData$se * 2, lwd = 1.5)

arrows(barCenters, myData$mean - myData$se * 2, barCenters,
       myData$mean + myData$se * 2, lwd = 1.5, angle = 90,
       code = 3, length = 0.05)