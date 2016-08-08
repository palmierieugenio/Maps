MapSp<-function(indicator='NY.GDP.PCAP.KD', nome.indicatore="GDP per capita (constant 2000 US$)", beginning=1990,ending=2016){
        dependencies()
        polygons<-importBorders()
        dati<-importWDI(indicator=indicator,beginning=beginning,ending=ending)
        
        sottoinsieme<-merge(polygons,dati,by.x="NAME",by.y="country",all=TRUE)
        
        names(sottoinsieme@data)<-c("COUNTRY","FIPS","ISO2","ISO3","UN","AREA","POP2005","REGION","SUBREGION","LON","LAT",indicator, "YEAR")

        library(sp)
        spplot(sottoinsieme,indicator,main=paste(nome.indicatore,sottoinsieme@data$YEAR[1])) # # nome.indicatore
        
}

# examples:
# MapSp()

# MapSp("MS.MIL.XPND.GD.ZS","Military expenditure (% of GDP)",2011,2016)

# MapSp("SL.UEM.1524.FE.ZS","Unemployment, youth female (% of female labor force ages 15-24)",2000,2016)
