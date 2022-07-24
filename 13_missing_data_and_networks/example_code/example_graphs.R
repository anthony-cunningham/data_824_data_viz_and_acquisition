##Example of graphs
library(igraph)
g1 <- graph( edges=c(1,2, 2,3, 3,1), n=3, directed=F ) 
plot(g1) # A simple plot of the network - we'll talk more about plots later
# Now with 10 vertices, and directed by default:
g2 <- graph( edges=c(1,2, 2,3, 3, 1), n=10)
plot(g2)
# When the edge list has vertex names, the number of nodes is not needed
g3 <- graph( c("John", "Jim", "Jim", "Jill", "Jill", "John")) # named vertices
plot(g3)
# In named graphs we can specify isolates by providing a list of their names.
g4 <- graph( c("John", "Jim", "Jim", "Jack", "Jim", "Jack", "John", "John"), 
             
             isolates=c("Jesse", "Janis", "Jennifer", "Justin") )
plot(g4, edge.arrow.size=.5, vertex.color="gold", vertex.size=15, 
     
     vertex.frame.color="gray", vertex.label.color="black", 
     
     vertex.label.cex=0.8, vertex.label.dist=2, edge.curved=0.2)
#Network layout
net.bg <- sample_pa(100) 
V(net.bg)$size <- 8
V(net.bg)$frame.color <- "white"
V(net.bg)$color <- "orange"
V(net.bg)$label <- "" 
E(net.bg)$arrow.mode <- 0
plot(net.bg)

tkid <- tkplot(net) #tkid is the id of the tkplot that will open
l <- tkplot.getcoords(tkid) # grab the coordinates from tkplot
plot(net, layout=l)

