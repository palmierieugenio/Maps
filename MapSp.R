MapSp<-function(indicator='NY.GDP.PCAP.KD', nome.indicatore="GDP per capita (constant 2000 US$)", beginning=1990,ending=2016){
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
        sottoinsieme@data$dati<-dati.ok[,2] # forse problema nome
        sottoinsieme@data$YEAR<- dati.ok$year
        
        library(sp)
        spplot(sottoinsieme,"dati",main=paste(nome.indicatore,sottoinsieme@data$YEAR[1])) # # nome.indicatore
        
}

MapSp()

MapSp("MS.MIL.XPND.GD.ZS","Military expenditure (% of GDP)",2011,2016)

MapSp("SL.UEM.1524.FE.ZS","Unemployment, youth female (% of female labor force ages 15-24)",2000,2016)