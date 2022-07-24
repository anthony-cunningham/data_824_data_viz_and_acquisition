if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ComplexHeatmap")

set.seed(123)
mat1 = rbind(cbind(matrix(rnorm(50*5, mean = 1), nr = 50), 
                   matrix(rnorm(50*5, mean = -1), nr = 50)),
             cbind(matrix(rnorm(50*5, mean = -1), nr = 50), 
                   matrix(rnorm(50*5, mean = 1), nr = 50))
)
View(mat1)
rownames(mat1) = paste0("R", 1:100)
colnames(mat1) = paste0("C", 1:10)
mat1 = mat1[sample(100, 100), ] # randomly permute rows
split = sample(letters[1:5], 100, replace = TRUE)
View(split)
split = factor(split, levels = letters[1:5])

library(ComplexHeatmap)
Heatmap(mat1, row_split = split)

##############################################################################
library(circlize) # >= 0.4.10
col_fun1 = colorRamp2(c(-2, 0, 2), c("blue", "white", "red"))
circos.heatmap(mat1, split = split, col = col_fun1)
##############################################################################
circos.par(start.degree = 90, gap.degree = 10)
circos.heatmap(mat1, split = split, col = col_fun1, track.height = 0.4, 
               bg.border = "green", bg.lwd = 2, bg.lty = 2, show.sector.labels = TRUE)

circos.heatmap(mat1, split = split, col = col_fun1, dend.side = "inside")
circos.clear()
circos.heatmap(mat1, split = split, col = col_fun1, dend.side = "outside")
circos.clear()
#############################################################################
circos.heatmap(mat1, split = split, col = col_fun1, rownames.side = "inside")
circos.clear()
text(0, 0, 'rownames.side = "inside"')
circos.heatmap(mat1, split = split, col = col_fun1, rownames.side = "outside")
circos.clear()
text(0, 0, 'rownames.side = "outside"')
############################################################################
circos.heatmap(mat1, split = split, col = col_fun1, dend.side = "inside", 
               rownames.side = "outside")
circos.clear()
circos.heatmap(mat1, split = split, col = col_fun1, dend.side = "outside", 
               rownames.side = "inside")
circos.clear()
###############################################################################
data<-read.csv("example_forcircos1.csv")
rownames(data) = paste0("R", 1:11)
colnames(data) = paste0("C", 1:4)
View(data)
chordDiagram(data)
col_fun1 = colorRamp2(c(-12, 0, 12), c("blue", "white", "red"))
circos.heatmap(data,col = col_fun1,dend.side="inside",rownames.side="outside")
circos.clear()