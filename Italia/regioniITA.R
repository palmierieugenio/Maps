setwd("C://Users//Eustachio//Desktop//Documenti//Documenti//Università//Software//R//MAPS//REGIONI E TERRITORI ITALIA")
library(sp)
library(plotGoogleMaps)
polygons<-readRDS("ITA_adm1.rds")
polygons@data$new<-1:20
map <- plotGoogleMaps(polygons[,c("new","NAME_1")],zoom=6,fitBounds=F,filename="Map_GoogleMaps_small.html",layerName="Economic Data",map="GoogleMap",mapCanvas="Map",map.width="1000px",map.height="750px",control.width="200px",control.height="600px")  
