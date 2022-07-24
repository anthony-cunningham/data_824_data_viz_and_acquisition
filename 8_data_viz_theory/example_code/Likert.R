if(!require(likert)){install.packages("likert")}
library(likert)
Input =("
  Q1      Q2      Q3
  3       2       4
  5       4       4
  4       2       4
  4       2       4
  4       1       5
  4       2       3
  4       3       5
  4       2       4
  5       2       4
  5       3       3
")

Data = read.table(textConnection(Input),header=TRUE)
View(Data)

### Change Likert scores to factor and specify levels

Data$Q1 = factor(Data$Q1,
                   levels = c("1", "2", "3", "4", "5"),
                   ordered = TRUE)

Data$Q2 = factor(Data$Q2,
                     levels = c("1", "2", "3", "4", "5"),
                     ordered = TRUE)

Data$Q3 = factor(Data$Q3,
                     levels = c("1", "2", "3", "4", "5"),
                     ordered = TRUE)
summary(Data)
Result = likert(Data)

plot(Result,
     type="bar")
#####################################################
dt<-data(pisaitems) 
View(dt)
items28 <- pisaitems[, substr(names(pisaitems), 1, 5) == "ST24Q"]
View(items28)
p <- likert(items28) 
plot(p)
