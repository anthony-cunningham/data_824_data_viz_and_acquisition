install.packages("googleVis")
library(googleVis)

#Import Fruits dataset

View(Fruits)
Combo <- gvisComboChart(Fruits, xvar="Fruit",yvar=c("Sales", "Profit"),
                        
                        options=list(seriesType="bars",
                                     
                                     series='{1: {type:"line"}}'))



plot(Combo)

