install.packages("FactoMineR")
install.packages("factoextra")

library(FactoMineR)
library(factoextra)

##http://www.sthda.com/english/wiki/fviz-pca-quick-principal-component-analysis-data-visualization-r-software-and-data-mining

dat<-data("USArrests")
View(dat)

res.PCA<-PCA(USArrests,graph=FALSE)
fviz_eig(res.PCA)
fviz_pca_ind(res.PCA,repel=TRUE)
fviz_pca_biplot(res.PCA,repel=TRUE)
