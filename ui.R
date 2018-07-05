#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(shinydashboard)
library(plotly)
library(dplyr)
library(ggplot2)
library(googleVis)
shinyUI(dashboardPage(
  dashboardHeader(title = "My Dashboard"),
  dashboardSidebar(
    sidebarUserPanel("My Shiny Dashboard"),
    sidebarMenu(
      menuItem("Subway Top/Below Annual Ridership", tabName = "graph", icon = icon("graph"))
    )),
  # This graph will show the 10 largest Ridership for all New York City Subway Station .
  dashboardBody(
    df <- data.frame(station=c("Times Square 42nd Street/Port Authority Bus Terminal", "Grand Central 42nd Street", 
                               "34 Street-Herald Square", "14 Street-Union Square", "34 Street-Penn Station (7 Avenue)", 
                               "34 Street-Penn Station (8 Avenue)", "Fulton Street","59 Street-Columbus Circle", 
                               "Lexington Avenue-59 Street", "86 Street (Lexington Avenue)"), 
                     
                     val2011=c(60604822, 42795505, 37731386, 34927178, 26758623, 24751771, 17971983, 21300892,
                               20377141, 19425347),
                     val2012=c(62069437, 42984249, 37154138, 34639575, 27010176, 24851746, 17868334, 21599586,
                               20628942, 19686985),
                     val2013=c(63617614, 44893301, 38213448, 35309414, 27730331, 25726374, 18721694, 22774421,
                               21282767, 20528208),
                     val2014=c(65948730, 46074652, 39285568, 35677468, 28638643, 26493571, 20102397, 23566961,
                               21557198, 20735032),
                     val2015=c(66359208, 46737564, 39541865, 35320623, 28309160, 26147434, 21671684, 23299666, 
                               21407792, 20890828),
                     val2016=c(64531511, 46121509, 39000352, 34289822, 27741367, 25183869, 25162937, 23203443, 
                               21000635, 20337593)),
    plot(
      gvisColumnChart(df, xvar="station", 
                   yvar=c("val2011", "val2012", "val2013", "val2014","val2015", "val2016")
      )
      
    )
  )
))