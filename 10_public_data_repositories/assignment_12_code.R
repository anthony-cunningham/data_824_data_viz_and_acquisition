## Assignment 12: Online Data Sources

library(readr)

if(!file.exists('./datasets/life_expectancy')){
    dir.create('./datasets/life_expectancy')
}

url <- 'https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who?resource=download'
dest_file <- paste0(getwd(), '/datasets/life_expectancy/life_expectancy.csv')

download.file(
    url=url,
    destfile=dest_file,
    method='curl',
)

life <- read_csv(dest_file)
