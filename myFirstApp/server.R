library(shiny)
library(ggplot2)

# Define server logic required to draw plot and regression line
shinyServer(function(input, output) {
    output$plot1 <- renderPlot({
        data("swiss")
        varNames <- names(swiss[,-1])
        listNames <- c("Agriculture", "Examination", "Education", "Catholic", "Infant.Mortality")
        labelx <- which(varNames %in% input$predictor)
        labelx <- listNames[labelx]
        xvar <- swiss[,input$predictor]
        
        # draw the plot with the specified x-variable
        g <- ggplot(swiss, aes(x = xvar, y = Fertility)) + geom_point(aes(colour = "red"),
                                                                      show.legend = FALSE)
        g <- g + labs(x = labelx, title = paste(labelx,
                                                "versus Fertility, with linear regression line"))
        g <- g + theme_bw() + geom_smooth(method = "lm")
        g
  }, width = 800)
})
