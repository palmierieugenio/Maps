dependencies<-function()        {
        list.of.packages <- c("rgdal", "rgeos","geosphere","raster","spdep","plotGoogleMaps","WDI","sp","cartography")
        new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
        if(length(new.packages)) install.packages(new.packages)
        lapply(list.of.packages, library, character.only = TRUE)

}

dependencies()