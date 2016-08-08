poligoni.toscana<-function(){
        polyTRE<-readRDS("ITA_adm3.rds")
        toscana.comuni<-polyTRE[polyTRE@data$NAME_1=="Toscana",]
        toscana.comuni@data$comune<-toupper(toscana.comuni@data$NAME_3)
        toscana.comuni
}
poligoni.toscana()