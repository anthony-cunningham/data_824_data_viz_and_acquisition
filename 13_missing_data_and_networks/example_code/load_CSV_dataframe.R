library(tidyverse)

################### Load many CSV files in data frame ######################################
dt <- dir("data",full.names=T) %>% map_df(read_csv)
write.table(dt,file="test.csv",sep="\t")

########################## Combine Excel Files Fast #########################################
dir("data",full.names=T) %>% map_df(read_csv)

dir("data",full.names=T) %>% 
  map_df(read_delim,"\t",escape_double = FALSE, trim_ws=TRUE)

dt<-tibble(
  file=dir("data",full.names=T),
  data=map(file,read_csv))

dt %>% transmute(
  x=data,
  path=str_replace_all(file,"csv","txt")
) %>% pmap(write_tsv)



