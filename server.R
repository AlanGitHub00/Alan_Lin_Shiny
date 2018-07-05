#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# This graph will show the 10 lowest Ridership for all New York City Subway Station 
shinyServer(function(input, output) {
  df <- data.frame(station=c("Bay Pkwy (Culver Line)", "Aqueduct-North Conduit Avenue", "Beach 90 Street", 
                             "East 143 Streer-Saint Mary's Street ", "Beach 36 Street", 
                             "Rockaway Park-Beach 116 Street", "Beach 44 Street", "Beach 98 Street", 
                             "Beach 105 Street", "Broad Channel"),
                   
                   ridership2011=c(434564, 474915, 387012, 280840, 192676, 286902, 225250, 198503, 80580, 88837),
                   ridership2012=c(464906, 890505, 305397, 285464, 217880, 251080, 161946, 193332, 82088, 75969),
                   ridership2013=c(487308, 698115, 194416, 273895, 143400, 135956, 91331, 100594, 48916, 36849),
                   ridership2014=c(478322, 357399, 306284, 279012, 272799, 231407, 181758, 200197, 82980, 74386),
                   ridership2015=c(460536, 365488, 333006, 298462, 296860, 255542, 197543, 214040, 99254, 91766),
                   ridership2016=c(406793, 342494, 335515, 313386, 305816, 250220, 212440, 203795, 95469, 91208)
)
  plot(
    gvisColumnChart(df, xvar="station", 
                 yvar=c("ridership2011", "ridership2012", "ridership2013", "ridership2014", "ridership2015", "ridership2016")
    )
  )
  })
