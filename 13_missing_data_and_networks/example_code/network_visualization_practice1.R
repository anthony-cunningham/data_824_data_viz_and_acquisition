
devtools::install_github("kassambara/navdata")
library("navdata")
data("phone.call")
head(phone.call,3)

##Nodes are countries in the source and destination columns. 
## The values, in the column n.call will be used as edges weight. 

##node list: containing nodes labels and other nodes attributes
##edge list: containing the relationship between the nodes. 

##Creating node list

library(tidyverse)
##Get distinct source names
sources <-phone.call %>% 
  distinct(source) %>%
  rename(label=source)
##Get distinct destination names 

destinations <- phone.call %>%
  distinct(destination) %>%
  rename(label=destination)
## Join the two data to create node
##Add unique id for each country 

nodes<-full_join(sources,destinations, by="label")
nodes <- nodes %>% 
  mutate(id=1:nrow(nodes)) %>%
  select(id,everything())

## Create edges list
#Rename the n.call column to weight
phone.call <-phone.call %>%
  rename(weight=n.call) 
##Join nodes id from source column
edges <-phone.call %>%
  left_join(nodes, by=c("source"="label")) %>%
  rename (from =id)

#(b) Join nodes id for destination column
edges <-edges %>% 
  left_join(nodes, by=c("destination"="label")) %>%
  rename (to =id) 
##(c) Select/keep only the columns from and to 

edges <-select(edges,from,to,weight)
head(edges,3)

#### Create an igraph network object 

library(igraph)
net.igraph <- graph_from_data_frame(
  d=edges, vertices=nodes,
  directed=TRUE
)

set.seed(123)
plot(net.igraph,edge.arrow.size=0.05,
     layout=layout_with_graphopt)

###Use ggraph

##geom_node_point() :Draws node points
## geom_edge_link(): Draws edge links 
## scale edge_width_width() to set range (min and max value)
##geom_node_text(): add text label 
library(tidygraph)
library(ggraph)
net.tidy <-tbl_graph(
  nodes=nodes,edges=edges,directed=TRUE
)
ggraph(net.tidy, layout="graphopt") +
         geom_node_point() +
         geom_edge_link(aes(width=weight), alpha=0.8) +
         scale_edge_width(range=c(0.2,2)) +
         geom_node_text(aes(label=label), repel=TRUE) +
         labs(edge_width ="phone.call") 
        

