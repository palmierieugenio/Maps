importWDI<-function(indicator='NY.GDP.PCAP.KD', beginning=1960,ending=2016){
        dat = WDI(indicator=indicator, start=beginning, end=ending)
        dati<-dat[complete.cases(dat),]
        dati<-dati[dati$year==max(dati$year),]
        dati<-dati[,2:4]
        dati
}

dati<-importWDI()
