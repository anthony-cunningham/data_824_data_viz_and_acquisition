##Example of graphs
library(igraph)
g1 <- graph(edges=c(1,2, 2,3, 3,1), n=3, directed=F ) 
plot(g1) # A simple plot of the network - we'll talk more about plots later
# Now with 10 vertices, and directed by default:
g2 <- graph(edges=c(1,2, 2,3, 3,1, 3,8, 2,7), n=10)
plot(g2)
# When the edge list has vertex names, the number of nodes is not needed
g3 <- graph( c("John", "Jim", "Jim", "Jill", "Jill", "John")) # named vertices
plot(g3)

##############################################################################
nodes <- read.csv("Dataset1-Media-Example-NODES.csv", header=T, as.is=T)
links <- read.csv("Dataset1-Media-Example-EDGES.csv", header=T, as.is=T)
#Examine the data
head(nodes)
head(links)
#Creating an igraph object
library('igraph')
net <- graph_from_data_frame(d=links, vertices=nodes, directed=T) 
net
#We also have easy access to nodes, edges, and their attributes with:
E(net)       # The edges of the "net" object
V(net)       # The vertices of the "net" object
E(net)$type  # Edge attribute "type"
V(net)$media # Vertex attribute "media"

# Find nodes and edges by attribute:
# (that returns objects of type vertex sequence/edge sequence)
V(net)[media=="BBC"]
E(net)[type=="mention"]

# You can also examine the network matrix directly:
net[1,]
net[5,7]

#It is also easy to extract an edge list or matrix back from the igraph network:
as_edgelist(net, names=T)
as_adjacency_matrix(net, attr="weight")

# Or data frames describing nodes and edges:
#as_data_frame(net, what="edges")
#as_data_frame(net, what="vertices")

plot(net) # not a pretty picture!
#net <- simplify(net, remove.multiple = F, remove.loops = T)
plot(net, edge.arrow.size=.2,vertex.label=NA)
# Plot with curved edges (edge.curved=.1) and reduce arrow size:
# Note that using curved edges will allow you to see multiple links
# between two nodes (e.g. links going in either direction, or multiplex links)
plot(net, edge.arrow.size=.2, edge.curved=.1)
# Set edge color to light gray, the node & border color to orange 
# Replace the vertex label with the node names stored in "media"
plot(net, edge.arrow.size=.2, edge.color="red",
     vertex.color="green", vertex.frame.color="#ffffff",
     vertex.label=V(net)$media, vertex.label.color="black") 