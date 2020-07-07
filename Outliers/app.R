
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("How to Identify and Deal with Outliers"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            helpText("On the right, you see a simple linear model relating median household income and value added by businesses. 
                     Toggle the checkboxes below to remove some data points from the model."),
            checkboxGroupInput("remove",
                        "Click to remove:",
                        c("Middle Income Outliers" = "mid",
                          "High Income Outliers" = "high")),
            "Statisticians have established thresholds to define outliers. They depend on measures described below. Click below to learn how to easily calculate these measures and determine outliers."
        ),

        # Show a plot of the generated model
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
