library(plotrix)

zoomInPlot(rnorm(100),rnorm(100),rxlim=c(-1,1),rylim=c(-1,1))



zoomInPlot(rnorm(100),rnorm(100),rxlim=c(-1,1),rylim=c(-1,1),
           
           zoomtitle="Zoom In Plot",titlepos=-1.5,
           
           pch=20, xlab="X-axis", ylab="Y-axis" ,  col="blue")

