# Setup
library(dplyr)
library(plotly)

# Interactive Plotly Graph
BuildBar <- function(y.vars, error.vars) {
  plot <- plot_ly(x = c("Past Month", "Past Year", "Percieved Risk Average"),
                  y = y.vars,
                  type = "bar", 
                  error_y = ~list(value = error.vars,
                                  color = '#000000'),
                  marker = list(color = c('rgb(58,95,11)', 'rgb(58,95,11)', 'rgb(169,169,169)'), width = 1.5, 
                                line = list(color = 'rgb(169,169,169)'))) %>% 
          layout(title = "Marijuana Usage & Risk",
                 xaxis = list(title = "Marijuana Usage"),
                 yaxis = list(title = "Percent"))
  return(plot)
}
                    