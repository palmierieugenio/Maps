MapSmallWDI<-function(indicator='NY.GDP.PCAP.KD', nome.indicatore="GDP per capita (constant 2000 US$)", beginning=1990,ending=2016){
        dependencies()
        polygons<-importBorders()
        dati<-importWDI(indicator=indicator,beginning=beginning,ending=ending)

        sottoinsieme<-merge(polygons,dati,by.x="NAME",by.y="country",all=TRUE)
        
        names(sottoinsieme@data)<-c("COUNTRY","FIPS","ISO2","ISO3","UN","AREA","POP2005","REGION","SUBREGION","LON","LAT",nome.indicatore, "YEAR")
        sottoinsieme<-sottoinsieme[complete.cases(sottoinsieme@data$YEAR),]
        map <- plotGoogleMaps(sottoinsieme[,c(nome.indicatore,"COUNTRY","YEAR")],zoom=2,fitBounds=F,filename="Map_GoogleMaps_small.html",layerName="Economic Data",map="GoogleMap",mapCanvas="Map",map.width="800px",map.height="600px",control.width="200px",control.height="600px")  
}

# examples:
# MapWDI(,,1980,1985)

# MapWDI("MS.MIL.XPND.GD.ZS","Military expenditure (% of GDP)",1996,1997)

# MapWDI("SL.UEM.1524.FE.ZS","Unemployment, youth female (% of female labor force ages 15-24)",1980,1990)
