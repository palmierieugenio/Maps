MapWDI<-function(indicator='NY.GDP.PCAP.KD', nome.indicatore="GDP per capita (constant 2000 US$)", beginning=1990,ending=2016){
        dependencies()
        polygons<-importBorders()
        dati<-importWDI(indicator=indicator,beginning=beginning,ending=ending)
        
        nomiWB<-dati[,1]
        nomiMappa<-polygons@data$NAME
        
        numero<-NULL
        for(i in seq_along(nomiWB)){
                numero<-c(numero,match(nomiWB[i],nomiMappa))
                numero<-numero[!is.na(numero)]
        }
        
        sottoinsieme<-polygons[numero,]         # SUBSET 1
        
        nomi.sotto<-sottoinsieme@data$NAME
        
        
        numeroWB<-NULL
        for(i in seq_along(nomiMappa)){
                numeroWB<-c(numeroWB,match(nomiMappa[i],nomiWB))
                numeroWB<-numeroWB[!is.na(numeroWB)]
        }
        
        dati.ok<-dati[numeroWB,]                # SUBSET 2
        
        numero.order<-match(nomi.sotto,dati.ok[,1]) # ORDINA DATI
        
        dati.ok<-dati.ok[numero.order,]
        
        sottoinsieme@data$country.wd<-dati.ok$country
        sottoinsieme@data$indice.wd<-dati.ok[,2] # forse problema nome
        sottoinsieme@data$Year<- dati.ok$year
        
        names(sottoinsieme@data)<-c("FIPS","ISO2","ISO3","UN","COUNTRY","AREA","POP2005","REGION","SUBREGION","LON","LAT","country.wd",nome.indicatore, "YEAR")
        
        map <- plotGoogleMaps(sottoinsieme[,c(nome.indicatore,"COUNTRY","YEAR")],zoom=2,fitBounds=F,filename="Map_GoogleMaps.html",layerName="Economic Data")
}

MapWDI(,,2011,2012)

MapWDI("MS.MIL.XPND.GD.ZS","Military expenditure (% of GDP)",2011,2016)

MapWDI("SL.UEM.1524.FE.ZS","Unemployment, youth female (% of female labor force ages 15-24)",2000,2016)