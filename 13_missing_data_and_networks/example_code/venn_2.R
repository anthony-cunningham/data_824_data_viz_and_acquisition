library(VennDiagram)
##https://archive.ics.uci.edu/ml/datasets/mushroom

dat = read.table("agaricus-lepiota.data", header=F, 
                 row.names=NULL, sep=",")

shape = dat$V2
color = dat$V4

intersects = plyr::count(paste0(shape, "_", color))
shapes = plyr::count(shape)

area1 = shapes[shapes$x=="b",]$freq
area2 = shapes[shapes$x=="k",]$freq
cross.area = sum(intersects[intersects$x %in% c("b_b", "k_b"),]$freq)

draw.pairwise.venn(area1, area2, cross.area, fill=c("blue", "orange"))
