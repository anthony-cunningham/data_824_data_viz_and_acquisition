#iris dataset

View(iris)

# Basic static 3D scatterplot
install.packages("scatterplot3d")
library(scatterplot3d)
scatterplot3d(iris[1:3])

# Modified static 3D scatterplot
# Coloring, vertical lines
# and Regression Plane

s3d <-scatterplot3d(iris[1:3],
                    
                    pch = 16,
                    
                    highlight.3d = TRUE,
                    
                    type = "h",
                    
                    main = "3D Scatterplot")

plane <-lm(iris$Petal.Length ~ iris$Sepal.Length + iris$Sepal.Width)

plane1 <-summary(lm(iris$Petal.Length ~ iris$Sepal.Length + iris$Sepal.Width))

plane
s3d$plane3d(plane)



# Spinning 3D scatterplot

library(rgl)

library(RColorBrewer)

plot3d(iris$Petal.Length,  # x variable
       
       iris$Petal.Width,   # y variable
       
       iris$Sepal.Length,  # z variable
       
       xlab = "Petal.Length",
       
       ylab = "Petal.Width",
       
       zlab = "Sepal.Length",
       
       col = brewer.pal(3, "Dark2")[unclass(iris$Species)],
       
       size = 10)
