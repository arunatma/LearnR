###############################################################################
#                   Introduction to Leaflet library in R
# R Leaflet by RStudio: http://rstudio.github.io/leaflet/
# Leaflet is a javascript library - http://leafletjs.com 
#   by Vladimir Agafonkin  of Mapbox    
# Leaflet JS is ported to R by RStudio
###############################################################################

# Installation
install.packages("leaflet")

# Load the library 
library(leaflet)

m <- leaflet()  %>%
    addTiles()  %>%
    addMarkers(m, lat=13, lng=80, popup="Floods happened here in Dec 2015")
    
    
# Another way of representation of the same
# The piping operators above (%>%) comes from the magrittr package!
    
m <- leaflet()  
m <- addTiles()
m <- addMarkers(m, lat=13, lng=80, popup="Floods happened here in Dec 2015")

# Open the leaflet in a browser; 
m 

################################################################################

# Map methods
setView(m, lng=77, lat=13, zoom=9)          # Set View in Bangalore
fitBounds(m, 77, 11, 80, 13)                # BottomLeft and TopRight (x,y)
# Take the zoom and lat/long as given by the map 'm'
clearBounds(m)

# Directing Data to the Map
# 1. From a normal data frame   (Add markers from Chennai to Salem)
df = data.frame(Long = seq(78,80,0.2), Lat = seq(11.5,13,0.15))
leaflet(df) %>% addCircles() %>% addTiles()

# Using the same data frame, specifically mentioning the lat and long column
leaflet(df) %>% addCircles(lng = ~Long, lat = ~Lat) %>% addTiles()

# Override an existing map and use the data frame provided.
leaflet() %>% addCircles(data = df) %>% addTiles()
leaflet() %>% addCircles(data = df, lat = ~ Lat, lng = ~ Long) %>% addTiles()

# 2. Data from "sp" package.
library(sp)
Sr1 = Polygon(cbind(c(2, 4, 4, 1, 2), c(2, 3, 5, 4, 2)))
Sr2 = Polygon(cbind(c(5, 4, 2, 5), c(2, 3, 2, 2)))
Sr3 = Polygon(cbind(c(4, 4, 5, 10, 4), c(5, 3, 2, 5, 5)))
Sr4 = Polygon(cbind(c(5, 6, 6, 5, 5), c(4, 4, 3, 3, 4)), hole = TRUE)
Srs1 = Polygons(list(Sr1), "s1")
Srs2 = Polygons(list(Sr2), "s2")
Srs3 = Polygons(list(Sr4, Sr3), "s3/4")
SpP = SpatialPolygons(list(Srs1, Srs2, Srs3), 1:3)
# Specify the height and width of the map 
leaflet(height = "300px", width="200px") %>% addPolygons(data = SpP)

# 3. From the maps package "map" object. mapStates below is a "map" object.
library(maps)
mapStates = map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>%
  addPolygons(fillColor = topo.colors(10, alpha = NULL), stroke = FALSE)
  
# Using normal R objects and functions as leaflet map arguments.  

df = data.frame(
  lat = (runif(100) * 180) - 90,
  lng = (runif(100) * 180) - 90,
  size = runif(100, 5, 20),
  color = sample(colors(), 100)
)
m = leaflet(df) %>% addTiles()
m %>% addCircleMarkers(radius = ~size, color = ~color, fill = FALSE)

# Same lat,long - but mark with different size and colour.
m %>% addCircleMarkers(radius = runif(100, 4, 10), color = c('red'))

################################################################################

m <- leaflet() %>% setView(lng = 78.2, lat = 11.6, zoom = 12)
m %>% addTiles()    # Default tile

# Custom Tiles
m %>% addProviderTiles("Stamen.Toner")
m %>% addProviderTiles("CartoDB.Positron")
m %>% addProviderTiles("MtbMap")

# Combining multiple layers of tiles.
m %>% addProviderTiles("MtbMap") %>%
      addProviderTiles("Stamen.TonerLines",
        options = providerTileOptions(opacity = 0.35)
      ) %>%
      addProviderTiles("Stamen.TonerLabels")
      
################################################################################
