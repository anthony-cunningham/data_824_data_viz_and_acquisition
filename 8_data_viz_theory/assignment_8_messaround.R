# Assignment 8

library(dplyr)
library(ggplot2)
library(tidyr)
library(readr)

## Exercise 2
ff <- read_csv("datasets/forestfires.csv")

ff_agg <- ff %>% group_by(month) %>% summarise(n_fires = n())

# Change to ordinal
order <- c('jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sep', 'oct', 'nov', 'dec')
ff_agg$month <- factor(ff_agg$month, levels = order, ordered = TRUE)

# Create simple line chart
ff_agg %>% 
    ggplot(aes(x = month, y = n_fires, group = 1)) +
    geom_line() +
    geom_point(size = 4) +
    xlab("Month") +
    ylab("Forest Fire Count") +
    ggtitle("Forest Fires, by Month")

# Create simple bar chart
ff_agg %>% 
    ggplot(aes(x = month, y = n_fires)) +
    geom_bar(stat = "identity") +
    # geom_point(size = 4) +
    xlab("Month") +
    ylab("Forest Fire Count") +
    ggtitle("Forest Fires, by Month")
