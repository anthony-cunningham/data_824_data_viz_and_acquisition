library(cluster)
library(factoextra)

head(USArrests)
mydata<-scale(USArrests)
head(mydata)

res.hc <- hclust(dist(mydata), method="ward.D2")
fviz_dend(res.hc,cex=0.5,k=3,palette="jco")

