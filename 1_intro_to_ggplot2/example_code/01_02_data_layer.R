# 1.2 Data

rm(list = ls())
graphics.off()

install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(dplyr)

# 1st layer data

# assign cars fuel economy data to data frame
#data frame is called the mpg
df <- ggplot2::mpg

#Learn more about the data

help("mpg")
#structure of the data
str("mpg")
#see the top of the data
head(mpg)

# create new variable called transmission from variable trans
#check the variable of the trans variable
#different type of transmissions with different gears
#pipe operator to change the command 
#we create a new variable with mutate and grep the first letter and only one 
#letter from trans; use case statement to record the values

#substr(x, start, stop)

unique(df$trans)
df <- df %>% mutate(transmission = substr(trans, 1, 1)) %>% 
  mutate(transmission = case_when(transmission == "a" ~ "automatic trans.",
                                  transmission == "m" ~ "manual trans.")) 

#we can use unique or distinct
df %>% distinct(drv)
# create new variable type_of_drive from variable drv
#Factor variables are categorical variables that can be either numeric or string variables.
#Factor is a data structure used for fields that takes only predefined, finite number of
#values (categorical data).
# convert in factor variable since they are character
#it is important to be aware of those two functions
#The function factor is used to encode a vector as a factor

df <- df %>%
  mutate(type_of_drive = case_when(drv == "f" ~ "front-wheel drive",
                                   drv == "r" ~ "rear-wheel drive",
                                   drv == "4" ~ "4-wheel drive")) %>% 
  mutate(type_of_drive = factor(type_of_drive, levels = c("front-wheel drive", "rear-wheel drive", "4-wheel drive")),
         transmission = factor(transmission, levels = c("manual trans.", "automatic trans.")))
#now we have Factor with 2 and 3 levels
d<-str(transmission)
# start building plot with data layer. What do you see?
ggplot(data = df)

#or
ggplot(df)
#or
df %>% ggplot()

#We need to add variables to the plot so we can see some data


