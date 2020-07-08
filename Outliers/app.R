
library(shiny)
library(tidyverse)
library(dplyr)
library(ggthemes)

initial <- read_csv("data/airqedited.csv")

# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel("How to Identify and Deal with Outliers"),
    navbarPage("Tabs",
    tabPanel("About",
        fluidRow(
            column(3,
                   h3("About")
                   )
        ), # end of title row
        fluidRow(
            column(6,
                h5("This tab contains the first part of info.")
            ),
            column(6,
                   h5("This contains the second part of about info.")
                   )
        ) #end of second row
    ), #end of first tab
    
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
            ),
            # Show a plot of the generated model
            mainPanel(
                plotOutput("modelTab2")
            )
        ) 
        ), #end of second tab
    
    tabPanel("Measuring Outliers",
        sidebarLayout(
            sidebarPanel(
            helpText("Toggle the radio buttons to learn how to calculate measures for outliers and what they mean."),
            radioButtons("measure",
                         "Choose your measure:",
                         c("Cook's Distance" = "cooksDistance",
                           "Standardized residuals" = "standardizedResiduals",
                           "Leverage" = "leverage"
                         ))
        ),
        mainPanel(
            plotOutput("measuresTab3"),
            textOutput("measureExplanation")
        )
        )
    ), #end of third tab
    
    tabPanel("Solutions for Outliers",
        sidebarLayout(
            sidebarPanel(
                "Potential solutions in this tab"
            ),
            mainPanel()
        )
    ), #end of fourth tab
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
