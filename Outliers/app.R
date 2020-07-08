
library(shiny)
library(tidyverse)
library(dplyr)
library(ggthemes)

initial <- read_csv("data/airqedited.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("How to Identify and Deal with Outliers"),
    navbarPage("Tabs",
    tabPanel("Identify Outliers",

    # Sidebar with checkboxes
    sidebarLayout(
        sidebarPanel(
            helpText("On the right, you see a simple linear model relating median household income and value added by businesses. 
                     Toggle the checkboxes below to remove some data points from the model."),
            checkboxGroupInput("remove",
                        "Click to remove:",
                        c("Middle Income Outliers" = "mid",
                          "High Income Outliers" = "high")),
            "Statisticians have established thresholds to define outliers. They depend on measures described below. Click below to learn how to easily calculate these measures and determine outliers."),
            # Show a plot of the generated model
            mainPanel(
                plotOutput("modelTab1")
            )
        ), #end of first tab
        ),
        
    tabPanel("Solutions for Outliers",
        sidebarLayout(
            sidebarPanel(
                "Stuff for second tab"
            ),
            mainPanel()
        )
    ), #end of second tab
    tabPanel("Quiz",
        "Insert Quiz"
    )
)
)

# Define server logic required to draw model
server <- function(input, output) {

    output$modelTab1 <- renderPlot({
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
