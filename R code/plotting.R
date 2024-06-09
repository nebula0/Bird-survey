library(caret)
library(dplyr)
library(ggmap)
library(readxl)

#setwd("C:/Users/User/Desktop/course files archive/112/Ecology Exp/bird survey")
Sys.setlocale("LC_ALL", "Chinese (Traditional)_Taiwan.950")
data <- read_xlsx("bird survey all.xlsx", sheet = "Group 6")

df <- data %>% group_by(樣點編號) #%>%
  #summarize(median_price = median(price), transactions = n(),
  #          latitude = mean(latitude), longitude = mean(longitude))

ggplot() +
  geom_point(data = df, mapping = aes(x = longitude, y = latitude,
                                      col = median_price, size = transactions)) +
  scale_color_distiller(palette = "YlOrRd", direction = 1)

ggplot(data = df, mapping = aes(x = longitude, y = latitude)) +
  geom_point(aes(col = median_price, size = transactions)) +
  geom_text(aes(label = city), size = 2, nudge_y = 0.01) +
  scale_color_distiller(palette = "YlOrRd", direction = 1)

height <- max(Sacramento$latitude) - min(Sacramento$latitude)
width <- max(Sacramento$longitude) - min(Sacramento$longitude)
sac_borders <- c(bottom  = 25.011212,
                 top     = 25.022827,
                 left    = 121.528910,
                 right   = 121.546605)
#map <- get_stamenmap(sac_borders, zoom = 10, maptype = "toner-lite")
register_stadiamaps(key = "cbb98194-25e7-4a92-b28e-00de092b54dc")
map <- get_stadiamap(sac_borders, zoom = 10, maptype = "stamen_toner_lite")

ggmap(map)

ggmap(map) +
  geom_point(data = df, mapping = aes(x = X座標, y = Y座標,
                                      col = 鳥種, size = 數量))
  #scale_color_distiller(palette = "YlOrRd", direction = 1)

