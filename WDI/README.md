#PASSAGGI:

###Caricare queste funzioni:
 1)	dependecies.R
 2) importWDI.R
 3) importborders.R
 4) Una o più di queste: MapWDI.R , MapSmallWDI.R , 	MapSp.R .
 
 Lanciare una di queste: MapWDI.R , MapSmallWDI.R , 	MapSp.R (le prime tre funzioni vengono chiamate all'interno delle quarte).
 
 In particolare:
 
1)	dependecies.R : scarica i pacchetti necessari e li carica;
2) importWDI.R : importa i dati tramite WDI, l'applicazione della Banca Mondiale;
3) importborders.R : importa un spatialdataframe coi confini delle nazioni
4) MapWDI.R , MapSmallWDI.R e MapSp.R : richiamano le funzioni precedenti e combinano il database dei confini con quello dei dati.

Il punto 4 differisce per il tipo di visualizzazione, qui degli esempi:

MapWDI.R : <http://www.fabioveronesi.net/Blog/Map_GoogleMaps.html>
MapSmallWDI.R : <http://www.fabioveronesi.net/Blog/Map_GoogleMaps_small.html>
MapSp.R : <http://1.bp.blogspot.com/-6eV1ew45h5I/VVH5OiQE1tI/AAAAAAAAQ5E/4jyPKpGFs9k/s1600/Blog_Map_CO2.jpeg>

Da mettere in evidenza che il risultato delle prime due è una mappa dinamica (a pagina piena o in un riquadro) in un file html
([inseribile in un sito all'interno di un tag iframe](http://stackoverflow.com/questions/38790416/plotgooglemaps-r-package-on-cms)),
mentre la terza crea una semplice immagine jpeg.
