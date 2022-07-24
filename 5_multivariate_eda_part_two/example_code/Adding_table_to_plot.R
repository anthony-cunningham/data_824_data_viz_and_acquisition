##Adding table to a plot

install.packages("plotrix")
library(plotrix)

testdf<-data.frame(First=c(10,7,5),Second=c(8,6,2),Third=c(5,3,4))
view(testdf)
rownames(testdf)<-c("Red","Green","Blue")

barp(testdf,main="Bar Plot",ylab="Value",
     
     names.arg=colnames(testdf),col=2:4)

# show most of the options

## coordinate values 2 and 8. 
##hlines for horizontal lines
addtable2plot(2,8,testdf,bty="o",display.rownames=TRUE,hlines=TRUE,
              
              title="table")

