library(tidyquant)
library(plotly)

getStockData <- function(ticker="AMZN",
                         fromDate=today()-90,
                         toDate=today()){
  dt <- tq_get(ticker,from=fromDate,to=toDate)
  dt <- dt %>% 
    tq_mutate(select = close,mutate_fun = EMA)
}

plotStockData <- function(dt){
  dt %>% plot_ly(type = "candlestick",
                 x=~date,open=~open,
                 close=~close,high=~high,
                 low=~low) %>% 
    add_lines(x=~date,y~EMA,name="EMA")
}


