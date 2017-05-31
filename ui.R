# ui.r


library(shiny)
library(plotly)

shinyUI(navbarPage('Marijuana Facts',
                   
                   tabPanel("Introduction",
                    
                           
                            
                            # Main panel: display data
                              mainPanel(align = "center",
                                #output datavis
                                img(src="./leaf18n-1-web.jpg", height = 400, width = 300),
                                
                                #info on relevance of data
                                h1("Why do we care?"),
                                p("The following plots represent insightful information about the process of
                                   marijuana legalization as well as modern marijuana habits. From them we may interpret national
                                  behavior towards marijuana over time as well as locate potential areas where further education and policies concerning
                                  marijuana could be implemented, as the dangers of marijuana are unnecessarily embellished and the continuation
                                  of criminalization of the most used (somewhat) illicit drug in America is expensive and unneeded."),
                                br(),
                                
                                #background text
                                h4("Background"),
                                p("There has been a significant shift in stance on the legalization of marijuana
                                   within the past 40 years, beginning with the decriminalization of marijuana starting 
                                   in the early 1970's, the legalization of medical marijuana starting in 1996, and the
                                   legalization of recreational marijuana starting in 2012.", helpText( a("source", href="https://en.wikipedia.org/wiki/Timeline_of_cannabis_laws_in_the_United_States")), "The US has seen an undeniable
                                   phenomena of widespread removal of marijuana prohibition. The additional national support
                                   for marijuana legalization has come hand in hand with these developments. There are still questions
                                   and issues to be answered, though, as marijuana legalization is not national, and the perception
                                   of marijuana as an extreme danger still resides in conservative governmental bodies and their
                                   respective states despite the drug's relatively harmless consequences."),
                                br(),
                                
                                #legalization status
                                h4("Current Legalization Status"),
                                textOutput('introinfo'),
                                
                                #data collection info 
                                br(),
                                h4("How was the data collected?"),
                                p("Several of the datasets came from the Substance Abuse Mental Health Services Administration, as well as a Gallup study
                                  and a separate study conducted by Governing Data.")

                                
                              )
                            ),
                    
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
                                plotlyOutput('timeline'),
                                br(),
                                
                                #timeline conclusions
                                h2('Conclusions'),
                                p("There is a very evident increase in voters' support for legalization, with a", strong("52%"), "increase
                                  from 1969-2016, as well as a", strong("45%"), "decrease in public disapproval of legalization. This implies that over
                                  half of the national population has transitioned from opposal to approval over the course of 47 years. We can potentially attribute this to better 
                                  education of the drug and its consequences. Additionally, the fact that the no opinion option decreased", strong("5%"), "in this timespan is significant as well, as it could perhaps allude to the
                                  increased relevance of the legalization issue. Maybe more people have an opinion because the inclusion
                                  of marijuana in modern society has increased and has therefore been a very hot topic in the public arena.")
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
                              plotlyOutput("AvgMonthYear"),
                              
                              #conclusions about map 
                              h2('Conclusions'),
                              p("This map makes a lot of sense and correlates to the legalization of weed (medically and recreationally)
                               across the US. Most of the highest (pun intended - lol tell me if this is too cheesy) states are Rhode Island, Colorado, 
                               Vermont, Washington, and Alaska (monthly), with Oregon and District of Columbia being added to this list when we observe
                               highest yearly averages.", strong("All"), "of these states have either legalized recreational or medicinal marijuana use. All
                               states with a monthly average below 5.6% and a yearly average below 10.26% (excluding North Dakota) have", strong("no laws
                               legalizing marijuana."), "It is evident that", strong("the existence of marijuana legalization correlates with 
                               higher marijuana usage both monthly and yearly"), "and vice versa.")
                              
                            )
                          )
                          
                ),
                tabPanel('Bar Graph',
                         
                         # Create a sidebar layout for this tab (page)
                         sidebarLayout(
                           
                           # Create a sidebarPanel for your controls
                         sidebarPanel(
                           
                          #bar graph conclusions
                           h3('Conclusions'),   
                           p("We must first define risk perception to be perceieved great risk of harm from smoking marijuana once a month
                             among people aged 12 or older. It is important to consider the relevance of monthly/yearly marijuana usage that has been observed
                             in the previous map, as well as the map of monthly/yearly perceived risk shown below.
                             It appears that despite a national decrease in risk perception, the average risk perception is still a third
                             of the US population. There is a notable similarity between states with a", strong("high percentage of
                             monthly marijuana usage"), "and those with a", strong("low perceived risk of great harm from smoking."), 
                             "This is relatively unsurprising, as for example, those who use medical marijuana to cure their pains would not
                             perceive marijuana to be harmful but rather beneficial to them. Additionally, those who smoke recreationally
                             are more likely to continue to smoke recreationally. States who falsely", strong(
                             "perceive great harm"), "are similar to the states who", strong("smoke less weed monthly."), "and who also", 
                            strong("do not have laws on legalized marijuana."), "Perhaps these 
                             states lack a proper education of marijuana and do not understand its effects on its users and assume that
                            since it is a drug, it is a harmful drug. This unnecessary concern is most likely a byproduct of lack of
                            education on marijuana, and influences the lack of approval of legalized marijuana.")
                         ),
                         mainPanel(align = 'center',
                           #output datavis
                           plotlyOutput('plot'),
                           br(),
                           
                           #map of perceived risk
                           h3('Map of Perceived Monthly Risk in the US'),
                           img(src="./Screen_Shot_2017_05_31_at_8_25_50_AM.png", height = 400, width = 600),
                           helpText( a("source", href = "https://www.samhsa.gov/data/sites/default/files/report_2404/ShortReport-2404.pdf"))
                         )
                         )
                         
                )
                
                
    )
  )
