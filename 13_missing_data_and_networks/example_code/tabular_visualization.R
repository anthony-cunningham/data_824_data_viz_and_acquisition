# Create relations (i.e tabular visualization) in R 

install.packages("circlize")
library(circlize)

#Lets generate a random matrix and the corresponding adjacency list


#Example of adjancy matrix
#mat = matrix(1:9, 3)
#rownames(mat) = letters[1:3]
#colnames(mat) = LETTERS[1:3]
#mat


set.seed(999)
mat=matrix(sample(18,18),3,6)
rownames(mat)=paste0("S",1:3)
colnames(mat)=paste0("E",1:6)
mat

chordDiagram(mat)

##########################################
set.seed(999)
n = 1000
df = data.frame(sectors = sample(letters[1:8], n, replace = TRUE),
                x = rnorm(n), y = runif(n))
#Parameters for the circular layout
circos.par("track.height" = 0.1)
circos.initialize(df$sectors, x = df$x)

circos.track(df$sectors, y = df$y,
             panel.fun = function(x, y) {
               circos.text(CELL_META$xcenter, 
                           CELL_META$cell.ylim[2] + mm_y(5), 
                           CELL_META$sector.index)
               circos.axis(labels.cex = 0.6)
             })
col = rep(c("#FF0000", "#00FF00"), 4)
circos.trackPoints(df$sectors, df$x, df$y, col = col, pch = 16, cex = 0.5)
circos.text(-1, 0.5, "text", sector.index = "a", track.index = 1)

bgcol = rep(c("#EFEFEF", "#CCCCCC"), 4)
circos.trackHist(df$sectors, df$x, bin.size = 0.2, bg.col = bgcol, col = NA)