library(knitr)
library(leaflet)
library(leaflet.minicharts)
library(dplyr)
library(leaflegend)


Sys.setlocale("LC_ALL", "Chinese (Traditional)_Taiwan.950")
data <-read.csv("data/bird_origin_pie_shannon.csv")

colors <- c("#0d3b66", "#7dcfb6", "#fb5607", "#f4d35e")

basemap = leaflet() %>%
  addTiles() %>%
  addProviderTiles("Esri.WorldGrayCanvas") %>%
  setView(121.53815856394074, 25.018035617070748, zoom=15)

basemap %>%
  addMinicharts(
    data$X, data$Y, 
    type = "pie",
    chartdata = select(data, Endemic, Native, Invasive, Naturalized),
    colorPalette = colors,
    #width = 60* sqrt(data$alian + data$native + data$naturlized + data$endemic) / 
     # sqrt(max(data$native)), transitionTime = 0
    width = data$Shannon.Diversity ^4
  ) %>%
  addLegendSize(
    values = data$Shannon.Diversity^4,
    color = 'gray',
    fillColor = 'gray',
    opacity = .5,
    title = 'Shannon Diversity ^ 4',
    shape = 'circle',
    orientation = 'horizontal',
    breaks = 5, 
    position = 'topright')


