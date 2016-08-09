GeoChartWDI<-function(indicator='NY.GDP.PCAP.KD', nome.indicatore="GDP per capita (constant 2000 US$)", beginning=1990,ending=2016){
        dependencies()
        library(googleVis)
        dati<-importWDI(indicator=indicator,beginning=beginning,ending=ending)
        names(dati)[2]<-nome.indicatore
        
        dati<-dati[complete.cases(dati$year),]
        dati$country[dati$country=="Russian Federation"]<-"Russia"

        Geo<-gvisGeoChart(dati, locationvar="country", 
                colorvar=nome.indicatore,
               options=list(projection="kavrayskiy-vii"))
                plot(Geo)
        
}

# GeoChartWDI()

# GeoChartWDI("MS.MIL.XPND.GD.ZS","Military expenditure (% of GDP)",1996,1997)

# GeoChartWDI("SL.UEM.1524.FE.ZS","Unemployment, youth female (% of female labor force ages 15-24)",2000,2005)
