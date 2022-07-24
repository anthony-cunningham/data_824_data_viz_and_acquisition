### Interactive Network Visualization 

library(tidyverse)
library("navdata")
data("phone.call2")
head(phone.call2,3)

nodes<-phone.call2$nodes
edges<-phone.call2$edges
## forceNetwork() Creates D3 JavaScript force directed network graph
#forceNetwork(Links, Nodes, Source,Target, Value,NodeID, Nodesize,Group)
##EdgeID should start with 0
##NodeID should start with 0
##Source, target: the names of the column, in the edges data,containing the network
## source and target variables, respectively
## Values: the name of the column, in the edge data, containing the weight values for 
###edges. Use to indicate how wide the links are. 
##NodeID: the name of the column, in the nodes data,containing the node IDs. Use 
## for labeling the nodes. 
## Nodesize: the name of the column, in the nodes data, with some value to vary 
##the node radius's with. 
##Group: the name of the column, in the nodes data, specifying the group of each
##node. 

nodes_d3<-mutate(nodes, id=id-1)
edges_d3<-mutate(edges,from=from-1,to=to-1)

library("networkD3")
forceNetwork(Links=edges_d3, Nodes=nodes_d3, 
             Source="from",Target="to", 
             Value="weight",NodeID="label",Group="id",
             opacity=1,fontSize=16,zoom=TRUE)

#### Create sankey diagram #####################

sankeyNetwork(Links=edges_d3, Nodes=nodes_d3, 
              Source="from",Target="to", 
              Value="weight",NodeID="label",
              fontSize=16,unit="Letter(s)")

### Create tree-like graphs with network3D#################
set.seed(123)
hc<-USArrests %>% sample_n(15) %>%
  scale() %>% dist() %>%
  hclust(method="complete")
dendroNetwork(hc,fontSize=15)
