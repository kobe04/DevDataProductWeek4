library(shiny)
data("swiss")
varNames <- names(swiss[,-1])


# Title
shinyUI(fluidPage(
  titlePanel("Prediction of Fertility"),
  
  # Sidebar to select predictor variable 
  sidebarLayout(
    sidebarPanel(
       h3("Selection"),
       selectInput("predictor",
                   "Select the predictor variable:",
                   selected = varNames[1],
                   varNames),
       submitButton("Done")
    ),
    
    # Show a plot of the chosen variable with regression line
    mainPanel(
       plotOutput("plot1"),
       h4("K. van Splunter"),
       h5("24 March 2019")
    )
  )
))
