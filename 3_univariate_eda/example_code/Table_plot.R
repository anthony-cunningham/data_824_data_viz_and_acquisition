##Here we use a different R library to show a representation of some of
## the variables from the diamond data

##This is a table plot using tabplot function

library(devtools)
install_github("mtennekes/tabplot")
library(tabplot)
View(diamonds)

# add some NA's to price and cut variables

is.na(diamonds$cut) <- diamonds$cut == "Ideal"

View(diamonds)
# plot tableplot using tabplot function

tableplot(diamonds,
          
          select = c(carat, price, cut, color, clarity),
          
          sortCol = price)







