library(shiny)
library(maps)
library(leaflet)
library(googleVis)
library(ggplot2)
library(dplyr)
library(tidyr)

ridership <- read.csv(file = "Annual_ridership.csv")
View(ridership)
location <- read.csv(file = "Location.csv")
View(location)

ui <- fluidPage(
  titlePanel(title = h4("Annual Ridership for New York City Subway", align="center")),
  sidebarPanel(
    selectInput("Ridership_2016", label="Annual Ridership 2016", choices = annual_ridership$Y2016),
    selectInput("Station", label="Station", choices = annual_ridership$Station),
    selectInput("Borough", label="Borough", choices = c("The Bronx", "Brooklyn", "Manhattan", "Queens")
    )
),


  mainPanel(
     g <- ggplot(data = ridership, aes(x = Y2016Ridership, y = Station))
  ))

server <- function(input,output){
  
  reactive_data = reactive({
    selected_year = as.numeric(annual_ridership$Y2016_Ridership)
    return(data[annual_ridership$year==selected_year,])
    
  })
  
  output$bar <- renderPlot({
    
    color <- c("blue", "red")
    
    our_data <- reactive_data()
    
    barplot(colSums(our_data[,c("Y2016_Ridership","Station")]),
            ylab="Y2016_Ridership",
            xlab="Station",
            names.arg = c("Y2016_Ridership", "Station"),
            col = color)
  })
}

shinyApp(ui, server)