# ui.r


library(shiny)
library(plotly)

shinyUI(fluidPage(
  
  # Create sidebar layout
  sidebarLayout(
    
    # Side panel for controls
    sidebarPanel(
      
    #Widget   
      selectInput('yvar', label = 'Variable to Graph', choices = list("% For Legalization" = 'Percent_Yes', '% Against Legalization' = 'No_Illegal', '% No Opinion' = 'No_Opinion'))
    ),      


    # Main panel: display data
      mainPanel(
        #output datavis
          plotlyOutput('timeline')
      )
    )
  )
)