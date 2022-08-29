library(shiny)

shinyUI(
    navbarPage("Shiny Application",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("How Air Quality Factors Affect Temperature"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Ozone" = "Ozone",
                                                  "Solar Radiation" = "Solar.R",
                                                  "Wind" = "Wind",
                                                  "Month" = "Month"
                                                  )),
                                    ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("aqBoxPlot")),
                                                    plotOutput("aqPlot"),
                                                tabPanel("Supporting Documentation"),
                                                h4("Data set is from R datasets, airquality"),
                                                h4("Here you can view box plots of airquality data as it relates
            to temperature. Use the selection panel to choose the variable 
            to see it's relationship to temperature."  ),
                                                h4("This data frame contains 153 observations and 6 variables. Variables
            are Ozone, Solar Radiation, Wind, Temp, Month, and Day."),
                                                       )
                                    )
                                )
                            )
                        )
    )
)

    