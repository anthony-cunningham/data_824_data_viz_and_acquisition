##Multiple correspondance analysis (MCA)
library(FactoMineR)
library(factoextra)

data("poison")
head(poison)
head(poison[, 1:8],4)

#Compute multiple correspondence analysis: 

res.mca <- MCA(poison, quanti.sup =1:2,quali.sup = 3:4, graph=FALSE)

##Graph of individuals, colored by groups ("Sick")
p<-fviz_mca_ind(res.mca, label="none", repel=TRUE, habillage = "Sick", 
             addEllipses = TRUE, ellipse.level = 0.95)
print(p)
## Graph of variables categories
fviz_mca_var(res.mca, repel=TRUE)

##Biplot of individuals and variables
fviz_mca_biplot(res.mca, repel=TRUE,
                ggtheme=theme_minimal())
