require(devtools)
install_github('ramnathv/rCharts')
require(devtools)
install_github('rCharts', 'ramnathv')
require(rCharts)
library(rCharts)

View(HairEyeColor)
hair_eye = as.data.frame(HairEyeColor)
n1<- nPlot(Freq ~ Hair , group= 'Eye', type = 'multiBarChart', data=subset(hair_eye, Sex=='Male'))
n1
#n1$save('n1.html', cdn = TRUE)
#cat('<iframe src="n1.html" width=100%, height=600><iframe>')

######################################################################################
##The type of hPlot can be scatter, line, bubble, bar, or column
library(rCharts)
hair_eye <- as.data.frame(HairEyeColor)
p <- hPlot(Freq ~ Hair, title = 'hPLot type - column',group = 'Eye', data = subset(hair_eye, Sex == "Female"), type = 'column')
p$plotOptions(column = list(dataLabels = list(enabled = T, rotation = -90, align = 'right', color = 'white', x = 4, y = 10)))
p$xAxis(type = "category", labels = list(rotation = 90, align = "left"))
p$legend(margin = 30)
p$chart(zoomType = "xy")
a$exporting(enabled = T)
p

################################################################################
library(rCharts)
a <- hPlot(disp ~ mpg, data = mtcars, group = "cyl", type = "bubble", size = "hp", title = "Zoom with hPLot", subtitle = "bubble chart" )
a$exporting(enabled = T)
a$chart(zoomType = "xy",margin = list(left=100,right=100,top=100,bottom=200))
a

################################################################################
install.packages("reshape2")
library(reshape)
data(economics,package="ggplot2")
econ <- transform(economics, date=as.character(date))
m1 <- mPlot(x="date",y=c("psavert","uemped"), type="Line", data=econ)
m1

#m1$save('m1.html', cdn = TRUE)
#cat('<iframe src="m1.html" width=100%, height=600><iframe>')


