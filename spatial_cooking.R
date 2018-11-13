# Spatial exercises and examples

library(sf)
library(raster)
library(spData)

## Introduction

names(world)
head(world)
plot(world)

summary(world["lifeExp"])

world_mini <- world[1:2, 1:3]
world_mini
#> Simple feature collection with 2 features and 3 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -180 ymin: -18.3 xmax: 180 ymax: -0.95
#> epsg (SRID):    4326
#> proj4string:    +proj=longlat +datum=WGS84 +no_defs
#>   iso_a2 name_long continent                           geom
#> 1     FJ      Fiji   Oceania MULTIPOLYGON (((180 -16.1, ...
#> 2     TZ  Tanzania    Africa MULTIPOLYGON (((33.9 -0.95,...

plot(world[3:6])
plot(world["lifeExp"])

#Plots canbe addative as layers
#the subsequent code chunk combines countries in Asia
world_asia = world[world$continent == "Asia", ]
asia = st_union(world_asia)
#now plot the Asian continent over a map of the world. Note that the first plot must only have one facet for add = TRUE to work. If the first plot has a key, reset = FALSE must be used (result not shown):

plot(world["pop"], reset = FALSE)
plot(asia, add = TRUE, col = "red")

#https://geocompr.robinlovelace.net/spatial-class.html#vector-data
#2.2.4 Base plot arguments
plot(world["continent"], reset = FALSE)
cex = sqrt(world$pop) / 10000
world_cents = st_centroid(world, of_largest = TRUE)
plot(st_geometry(world_cents), add = TRUE, cex = cex)

#and a bounding box example
#Note the use of [0] to keep only the geometry column and lwd to emphasize India
india = world[world$name_long == "India", ]
plot(st_geometry(india), expandBB = c(0.5, 0.5, 0.5, 1), col = "gray", lwd = 3)
plot(world_asia[0], add = TRUE)
