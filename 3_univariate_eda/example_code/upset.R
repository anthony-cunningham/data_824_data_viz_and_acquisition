install.packages("UpSetR")
devtools::install_github("hms-dbmi/UpSetR")
install.packages('ComplexUpset')

library(ggplot2)
library(ComplexUpset)

##https://gehlenborglab.shinyapps.io/upsetr/
##http://gehlenborglab.org/research/projects/upsetr/
##https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5870712/
##https://upset.app/

movies = as.data.frame(ggplot2movies::movies)
head(movies, 3)


genres = colnames(movies)[18:24]
genres


upset(movies, nsets = 6, number.angles = 30, point.size = 3.5, line.size = 2, 
      mainbar.y.label = "Genre Intersections", sets.x.label = "Movies Per Genre", 
      text.scale = c(1.3, 1.3, 1, 1, 2, 0.75))

upset(movies, sets = c("Animation","Action", "Romance", "Comedy", "Drama", "Short"), 
      mb.ratio = c(0.55, 0.45), order.by = "freq")
