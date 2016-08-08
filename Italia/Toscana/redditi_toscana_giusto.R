base()
database<-dati.toscana()
spatialdatadabase<-poligoni.toscana()

numero<-match(spatialdatadabase@data$comune,database$comune)
numerodue<-match(database$comune,spatialdatadabase@data$comune)
numero<-numero[!is.na(numero)]
numerodue<-numerodue[!is.na(numerodue)]
        
sottoinsieme<-spatialdatadabase[numerodue,]
sottobase<-database[numero,]
ordina<-match(sottoinsieme@data$comune,sottobase$comune)
sottobase<-sottobase[ordina,]

sottoinsieme@data$poveri<-sottobase$perc.poveri

map <- plotGoogleMaps(sottoinsieme[,c("poveri","comune")],zoom=8,fitBounds=F,filename="Map_GoogleMaps.html",layerName="Economic Data")
