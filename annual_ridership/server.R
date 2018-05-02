library(shiny)
library(maps)
library(leaflet)
library(googleVis)
library(ggplot2)
annual_ridership <- read.csv(file = "Annual_ridership.csv")
View(annual_ridership)

server <- function(input, output, session) {
  leaflet() %>% addTiles() %>% # Add default OpenStreetMap map tiles
    addMarkers(lng=-74.0059, lat=40.7128, popup="New York City")
  
  output$dynamicPlot <- renderPlot({
    ggplot(mtcars, aes(x = year, y = borough)) + geom_point() + 
      ggtitle(annual_ridership$Y2011)
  })
}



