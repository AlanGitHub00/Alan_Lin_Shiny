#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
##Declaring Libraries
library(shiny)
library(maps)
library(leaflet)
library(googleVis)
library(ggplot2)

##Declaring static variables
colStates <- map("state", fill = TRUE, plot = FALSE,
                 region = c("new york"))

##Declaring UI
ui <- fluidPage(
  leafletOutput("mymap"),
  br(),
  checkboxInput("show", "Show States", value = FALSE)
)

##Declaring Libraries
server <- function(input, output, session) {
  leaflet() %>% addTiles() %>% # Add default OpenStreetMap map tiles
    addMarkers(lng=-74.0059, lat=40.7128, popup="New York City")
}
shinyApp(ui, server)
