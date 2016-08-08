setwd("C://Users//Eustachio//Desktop//Documenti//Documenti//Università//Software//R//MAPS//REGIONI E TERRITORI ITALIA")
library(sp)
library(plotGoogleMaps)
polyTRE<-readRDS("ITA_adm3.rds")
polyTRE@data$dato<-1:8100
map <- plotGoogleMaps(polyTRE[,c("dato","NAME_3")],zoom=6,fitBounds=F,filename="Map_GoogleMap_small.html",layerName="Economic Data",map="GoogleMap",mapCanvas="Map",map.width="1000px",map.height="750px",control.width="200px",control.height="600px")  