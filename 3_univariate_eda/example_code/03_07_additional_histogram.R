##More practice of histograms using the data mpg and mtcars. 

library(ggplot2)
theme_set(theme_classic())

data(mpg)
help(mpg)
head(mpg)

# Histogram on a Continuous (Numeric) Variable
#Colors: http://rstudio-pubs-static.s3.amazonaws.com/5312_98fc1aba2d5740dd849a5ab797cc2c8d.html
g <- ggplot(mpg, aes(displ)) + scale_fill_brewer(palette = "Spectral")

g + geom_histogram(aes(fill=class), 
                   binwidth = .1, 
                   col="black", 
                   size=.1) +  # change binwidth
  labs(title="Histogram with Auto Binning", 
       subtitle="Engine Displacement across Vehicle Classes")  

g + geom_histogram(aes(fill=class), 
                   bins=5, 
                   col="black", 
                   size=.1) +   #change number of bins
  labs(title="Histogram with Fixed Bins", 
       subtitle="Engine Displacement across Vehicle Classes") 

######################################################################################
#computes a histogram of the data values in the column mpg of the dataframe named "mtcars"
View(mtcars)
help(mtcars)
hist(mtcars$mpg)

####mpg is Miles/(US) gallon
# adding breaks and limits

hist(mtcars$mpg,breaks=14,xlim=c(10,35),ylim=c(0,10))

# adding colors to graph

hist(mtcars$mpg,breaks=14,xlim=c(10,35),
     
     col=rainbow(14),main="Histogram of Mtcars",
     
     col.main="blue",col.lab="red")

# adding labels to the graph

hist(mtcars$mpg,breaks=14, xlim=c(10,35),
     
     col=rainbow(14),main="Histogram of Mtcars",
     
     col.main="Blue",col.lab="red",labels=TRUE)
################################################################
# Overlapping histogram
####mpg is Miles/(US) gallon

h1<-mtcars$mpg

# Histogram Colored (blue and red)

hist(h1,
     
     col="red",
     
     xlim=c(10,30),ylim=c(0,10),breaks=10,
     
     main="Overlapping Histogram",xlab="Variable")

## qsec is 1/4 mile time
h2<-mtcars$qsec

hist(h2,col="blue",xlim=c(0,10),ylim=c(0,10),add=T)

## This function draws a box around the current plot in the given color and linetype. 

box()

