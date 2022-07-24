library(FactoMineR)
library(factoextra)

data("housetasks")
head(housetasks, 4)

#compute correspondence analysis

res.ca<- CA(housetasks, graph=FALSE)
fviz_ca_biplot(res.ca, repel =TRUE)
