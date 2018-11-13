#try things with the education data

library(tidyverse)
library(sf)

# Import tha shapefile
catchshp <- st_read(dsn = "data/catchments.shp")

head(catchshp)

# Isolate and plot primary catchments, note attached data doesn't give very good plots - will have to add variables & factors later
primaryshp <- catchshp %>%
  filter(CATCH_TYPE=="PRIMARY")
plot(primaryshp)

# Isolate NWPS, plot it amongst close-by primary catchments
nwps<- catchshp %>%
  filter(USE_DESC=="Normanhurst West PS")
plot(st_geometry(nwps), expandBB = c(1,1,1,1), col = "gray", lwd = 3)
plot(primaryshp[0], add=TRUE)
