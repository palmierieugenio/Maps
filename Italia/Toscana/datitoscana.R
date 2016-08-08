dati.toscana<-function(){
        link<-"C://Users//Eustachio//Desktop//Documenti//Documenti//Università//Software//R//MAPS//REGIONI E TERRITORI ITALIA - spatialdataframe\\Dati fiscali comunali 2015"
        setwd(link)
        dati<-read.csv2("Redditi_e_principali_variabili_IRPEF_su_base_comunale_CSV_2014.csv")
        toscana<-dati[dati$Regione=="Toscana",]
        toscana<-toscana[,c(4,8,33,35,37)]
        toscana$relativi<-round((toscana[3]+toscana[4])/toscana[2],2)
        toscana<-toscana[!is.na(toscana$relativi),]
        tosca<-cbind(toscana[1],toscana[,6]*100)
        tosca[,1]<-as.character(tosca[,1])
        names(tosca)<-c("comune","perc.poveri")
        tosca
}
dati.toscana()