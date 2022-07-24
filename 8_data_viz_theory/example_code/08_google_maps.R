library(googleVis)



View(Andrew)

AndrewMap<- gvisMap(Andrew, "LatLong" , "Tip",
                    
                    options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
                                 
                                 mapType='hybrid', useMapTypeControl=TRUE,
                                 
                                 width=800,height=800))

plot(AndrewMap)
