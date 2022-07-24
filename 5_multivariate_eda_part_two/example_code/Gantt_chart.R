install.packages("plotrix")
library(plotrix) # Required package

gantt_chart<-list(labels=c("Jim","Joe","Jim","John","John","Jake","Joe","Jed","Jake"),
                  
                  starts=c(8.1,8.7,13.0,9.1,11.6,9.0,13.6,9.3,14.2),
                  
                  ends=c(12.5,12.7,16.5,10.3,15.6,11.7,18.1,18.2,19.0))
View(gantt_chart)

gantt.chart(gantt_chart,  vgridlab=8:19, vgridpos=8:19,
            
            main="All bars having the same color", taskcolors="orange")

# fill colors in Gantt chart

gantt.chart(gantt_chart,vgridlab=8:19,vgridpos=8:19,
            
            main="A color for each label",taskcolors=c(2,3,7,4,8))

# Border of Gantt Chart

gantt.chart(gantt_chart,vgridlab=8:19,vgridpos=8:19,
            
            main="A color for each interval - with borders",
            
            taskcolors=c(2,3,7,4,8),border.col="black")

