#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)


shinyServer(function(input, output) {
    
    # Get all the checked variables separated by + (for example cyl+disp),
    # if nothing is checked make it 1
    lmvariables <- reactive({
        var.vector <- as.vector(input$variables)
        lmFormula<-paste("mpg~",
                      ifelse(length(var.vector)>0,
                             predictors<-paste(var.vector,
                                               collapse="+"),
                             "1"),
                      sep="")
        
    }) 
    
    # fits model based on selected variables
    fitModel<-reactive({
        lm(as.formula(lmvariables()), data=mtcars)
    })
    
    #Plot 4 diagnostic plots for the generated regression model
    output$mpgPlot<-renderPlot({
        par(mfrow = c(2, 2), oma = c(0, 0, 0, 0))
        plot(fitModel(),
             which=c(1,2,3,5),
             col="red", 
             sub.caption=paste("Plots for",
             lmvariables()))
        
    })
    #output summary data
    output$summaryFit <- renderPrint({
        summary(fitModel())
    })
})
