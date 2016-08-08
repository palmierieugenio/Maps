importBorders<-function(){
        #Change the following line to set the working directory  
        setwd("...")  
        #Download, unzip and load the polygon shapefile with the countries' borders  

        download.file("http://thematicmapping.org/downloads/TM_WORLD_BORDERS_SIMPL-0.3.zip",destfile="TM_WORLD_BORDERS_SIMPL-0.3.zip")  
        unzip("TM_WORLD_BORDERS_SIMPL-0.3.zip",exdir=getwd())  
        polygons <- shapefile("TM_WORLD_BORDERS_SIMPL-0.3.shp")

        # Modify the names of the countries to match Word Bank data
        polygons[polygons$NAME=="Libyan Arab Jamahiriya","NAME"] <- "Libya"
        polygons[polygons$NAME=="Democratic Republic of the Congo","NAME"] <- "Congo, Dem. Rep."
        polygons[polygons$NAME=="Congo","NAME"] <- "Congo, Rep."
        polygons[polygons$NAME=="Kyrgyzstan","NAME"] <- "Kyrgyz Republic"
        polygons[polygons$NAME=="United Republic of Tanzania","NAME"] <- "Tanzania"
        polygons[polygons$NAME=="Iran (Islamic Republic of)","NAME"] <- "Iran, Islamic Rep."
        polygons[polygons$NAME=="Russia","NAME"] <-  "Russian Federation"
        polygons[polygons$NAME=="Egypt","NAME"] <-  "Egypt, Arab Rep."
        polygons[polygons$NAME=="Venezuela","NAME"] <-  "Venezuela, RB"
        polygons[polygons$NAME=="Yemen","NAME"] <-  "Yemen, Rep."
        polygons[polygons$NAME=="Viet Nam","NAME"] <-  "Vietnam" 
        polygons[polygons$NAME=="Korea, Republic of","NAME"] <-  "Korea, Rep."
        
        # Delete Antarctica data (it creates problems with google Maps visualization)
        polygons <- polygons[polygons$NAME!="Antarctica",]
        
        polygons

}

polygons<-importBorders()