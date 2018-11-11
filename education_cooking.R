#try things with the education data

library(tidyverse)
library(sf)


catchshp <- st_read(dsn = "data/catchments.shp")


head(catchshp)


