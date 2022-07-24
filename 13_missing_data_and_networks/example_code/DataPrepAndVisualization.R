library(igraph)
library(visNetwork)

g <- make_tree(60,children = 2) %>% 
  set_vertex_attr("group",value = sample(c("x","y","z"),60,replace = T)) %>% 
  set_vertex_attr("size",value = sample(1:3*30,60,replace = T))

visIgraph(g,layout = "layout_as_tree",circular=T) %>% 
  visLegend()



