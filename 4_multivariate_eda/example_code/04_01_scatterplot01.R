
View(trees)

# scatter plot for entire dataset at once; 
#correlations are in the figure; 

plot(trees,col="blue")

# scatterplot for single column

plot(trees$Height,col="red")

# changes the points shape and size

plot(trees$Height,col="red",cex=1,pch=24)

# add line and points

plot(trees$Height,col="red",type="o",cex=1, pch=24)

# plot between Volume and Girth

plot(Volume ~ Girth,
     
     data = trees,
     
     main="Girth and Volume for Black Cherry Trees",
     
     col.main="red",pch=6,cex=1,col="blue",
     
     xlim=c(0,25), # set x-axis limits
     
     ylim=c(0,100))# set x-axis limits


# Remove all list of objects

rm(list=ls())