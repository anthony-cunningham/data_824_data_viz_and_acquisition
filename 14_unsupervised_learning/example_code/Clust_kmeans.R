library(cluster)
library(factoextra)

data("USArrests")
head(USArrests)
mydata<-scale(USArrests)
head(mydata)

#partitioning clustering

fviz_nbclust(mydata,kmeans,method="gap_stat")

#Compute and visualize k-means clustering 

set.seed(123)
km.res<-kmeans(mydata,3,nstart=25)
fviz_cluster(km.res, data=mydata, palette="jco",ggtheme=theme_minimal())

pam.res <- pam(mydata, 3)
fviz_cluster(pam.res)
