library(googleVis)

View(Fruits)


b <- gvisBubbleChart(Fruits, idvar="Fruit",
                     
                     xvar="Sales", yvar="Expenses",
                     
                     colorvar="Year", sizevar="Profit",
                     
                     options=list(hAxis='{minValue:75, maxValue:125}'))

plot(b)
