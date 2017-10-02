library(shiny)
library(dplyr)

shinyUI(
    fluidPage(
        titlePanel("Linear Regression of MPG with one or more predictors for mtcars dataset"),
        
        sidebarLayout(
            sidebarPanel(
                # retrieve user's selected variables. Don't include MPG
                selectInput("variables","Select one or more predictors:",
                            names(select(mtcars,-mpg)),
                            selected = "cyl",
                            selectize = TRUE,
                            multiple = TRUE),
                h2("Data description"),
                helpText("The data was extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973-74 models)."),
                h2("Data"),
                p("A data frame with 32 observations on 11 variables."),
                tags$ol(
                    tags$li(code("mpg"), "Miles/(US) gallon"),
                    tags$li(code("cyl"), "Number of cylinders"),
                    tags$li(code("disp"), "Displacement (cu.in.)"),
                    tags$li(code("hp"), "Gross horsepower"),
                    tags$li(code("drat"), "Rear axle ratio"),
                    tags$li(code("wt"), "Weight (lb/1000)"),
                    tags$li(code("qsec"), "1/4 mile time"),
                    tags$li(code("vs"), "V-engine / Standard"),
                    tags$li(code("am"), "Transmission (0 = automatic, 1 = manual)"),
                    tags$li(code("gear"), "Number of forward gears"),
                    tags$li(code("carb"), "Number of carburetors")
                    ),
                h3("Source"),
                p("Henderson and Velleman (1981), Building multiple regression models interactively. Biometrics, 37, 391-411.")
            ),
            
            mainPanel(
                plotOutput("mpgPlot"),
                verbatimTextOutput("summaryFit")
            )
        )
    )
)
