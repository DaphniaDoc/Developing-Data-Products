library(shiny)
library(datasets)

aqData <- airquality
aqData$Temp <- factor(aqData$Temp)

shinyServer(function(input, output) {
    
    formulaText <- reactive({
        paste("Temp ~", input$variable)
    })
    
    formulaTextPoint <- reactive({
        paste("Temp ~", "as.integer(", input$variable, ")")
    })
    
    output$caption <- renderText({
        formulaText()
    })
    
    output$aqBoxPlot <- renderPlot({
        boxplot(as.formula(formulaText()), 
                data = aqData)    })
    
})
