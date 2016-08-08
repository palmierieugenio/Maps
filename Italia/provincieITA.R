setwd("C://Users//Eustachio//Desktop//Documenti//Documenti//Università//Software//R//MAPS//REGIONI E TERRITORI ITALIA")
library(sp)
library(plotGoogleMaps)
polyDue<-readRDS("ITA_adm2.rds")
polyDue@data$dato<-1:113
map <- plotGoogleMaps(polyDue[,c("dato","NAME_2")],zoom=6,fitBounds=F,filename="Map_GoogleMap_small.html",layerName="Economic Data",map="GoogleMap",mapCanvas="Map",map.width="1000px",map.height="750px",control.width="200px",control.height="600px")  
