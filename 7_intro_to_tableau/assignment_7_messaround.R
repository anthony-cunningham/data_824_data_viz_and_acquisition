# Assignment 7

library(dplyr)
library(tidyr)
library(readr)

## Exercise 3
t1 <- read_csv("datasets/Table1.csv")
t2 <- read_csv("datasets/Table2.csv")

t_joined <- inner_join(t1, t2, by = "Accession")

head(t_joined)
