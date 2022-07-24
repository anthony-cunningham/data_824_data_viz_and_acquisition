# Assignment 11 Code

library(readr)
library(tidyverse)
library(ggplot2)

p <- read_delim("datasets/BIOGRID-ALL-4.4.202.tab/BIOGRID-ALL-4.4.202.tab.txt", delim = "\t", escape_double = FALSE)

colnames(p) <- tolower(colnames(p))

p <- p %>% select(c(official_symbol_a, official_symbol_b))

write_csv(p, "datasets/BIOGRID-ALL-4.4.202.tab/BIOGRID-ALL-4.4.202.csv")


s <- read_csv("datasets/BIOGRID-ALL-4.4.202.tab/protein_summaries.csv")

# Convert to long
s <- pivot_longer(
    s,
    cols = everything(),
    names_to = 'protein',
    values_to = 'count'
    )

s %>%
    filter(protein != 'total') %>%
    # mutate(name = fct_reorder(name, val)) %>%
    ggplot(aes(x = protein, y = count)) +
    geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.4) +
    coord_flip() +
    xlab("Protein") +
    ylab("Number of Interactions")
    theme_bw()
