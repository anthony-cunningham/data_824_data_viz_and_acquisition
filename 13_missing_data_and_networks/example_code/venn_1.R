library(VennDiagram)

venn.plot<-venn.diagram(list(A = 1571:2020,B = 1:1800),fill = c("lightblue", "pink"),
                        
                        alpha = c(0.3, 0.7), cex = 3,cat.fontface = 4,lty =3, fontfamily =5,
                        
                        filename = NULL)

grid.draw(venn.plot)



# TO save plot in working Directory directly

venn.plot<-venn.diagram(list(A = 1571:2020,B = 1:1800),fill = c("green", "red"),
                        
                        alpha = c(0.5, 0.5), cex = 2,cat.fontface = 4,lty =2,
                        
                        fontfamily =3, filename ="VennDiagram.jpeg")