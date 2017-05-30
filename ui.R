# ui.r


library(shiny)
library(plotly)

shinyUI(navbarPage('Marijuana Timeline',
                  tabPanel("Timeline for Marijuana Legalization",
                  
                          
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
                 ),
                 tabPanel('Map',
                          # Create a sidebar layout for this tab (page)
                          sidebarLayout(
                            sidebarPanel(
                              p('States with Most Usage'),
                              
  
                              selectInput(inputId = "var",
                                          label = "Month vs. Year:",
                                          choices = c("Month", "Year"),
                                          selected = "Month")
                              
                            ),
                            
                            # Show a plot of the generated distribution
                            mainPanel(
                              plotlyOutput("AvgMonthYear")
                            )
                          )
                          
                ),
                tabPanel('Bar Graph',
                         
                         # Create a sidebar layout for this tab (page)
                         sidebarLayout(
                           
                           # Create a sidebarPanel for your controls
                         sidebarPanel(
                             
                             #Widet
                             
                             
                         ),
                         mainPanel(
                           #output datavis
                           plotlyOutput('timeline')
                         )
                         )
                         
                )
    )
  )
