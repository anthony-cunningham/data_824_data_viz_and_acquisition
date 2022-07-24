library(shiny)
library(plotly)
library(shinythemes)
library(dplyr)
library(forcats)

data(mtcars)

ui = fluidPage(
  theme = shinytheme("superhero"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "cyl_in", label="Cylinders", choices = c("All", sort(unique(mtcars$cyl))), selected="All")
    ),
    mainPanel(
      plotlyOutput(outputId = "car_mpg"),
      br(),
      plotlyOutput(outputId = "disp"),
      br(),
      plotlyOutput(outputId = "cyl")
    )
  )
)

server = function(input, output) {
  output$car_mpg = renderPlotly({
    car_dat = mtcars
    
    if(input$cyl_in != "All") {
      car_dat = car_dat[car_dat$cyl == input$cyl_in,]
    }
    
    car_dat %>% 
      plot_ly(x = ~hp, y = ~mpg, type="scatter", mode="markers", source="mpg") %>% 
      layout(title = "MPG vs HP",
             xaxis = list(title = "HP"),
             yaxis = list(title = "MPG"),
             margin = list(l = 50, r = 50, b = 50, t = 50),
             dragmode = "select")
  })
  
  output$disp = renderPlotly({
    e_dat1 = event_data("plotly_selected", source="mpg")
    e_dat2 = event_data("plotly_click", source="mpg")
    
    car_dat = mtcars
    
    if(input$cyl_in != "All") {
      car_dat = car_dat[car_dat$cyl == input$cyl_in,]
    }
    
    if(!is.null(e_dat1)) {
      car_dat = car_dat[e_dat1$pointNumber + 1,]
    } else if(!is.null(e_dat2)) {
      car_dat = car_dat[e_dat2$pointNumber + 1,]
    }
    
    car_dat %>% 
      plot_ly(x = ~disp, type="histogram") %>% 
      layout(title = "Distribution of Displacement",
             xaxis = list(title = "Displacement"),
             margin = list(l = 50, r = 50, b = 50, t = 50))
  })
  
  output$cyl = renderPlotly({
    e_dat1 = event_data("plotly_click", source="mpg")
    e_dat2 = event_data("plotly_selected", source="mpg")
    
    car_dat = mtcars
    
    if(input$cyl_in != "All") {
      car_dat = car_dat[car_dat$cyl == input$cyl_in,]
    }
    
    car_dat$model = rownames(car_dat)
    
    if(!is.null(e_dat1)) {
      car_dat = car_dat[e_dat1$pointNumber + 1,]
    } else if(!is.null(e_dat2)) {
      car_dat = car_dat[e_dat2$pointNumber + 1,]
    }
    
    car_dat$model = fct_reorder(car_dat$model, car_dat$cyl, .desc=TRUE)
    
    car_dat %>% 
      plot_ly(x = ~model, y = ~cyl, type="bar") %>% 
      layout(title = "Number of Cylinders",
             xaxis = list(title = "Model"),
             yaxis = list(title = "Number of Cylinders"),
             margin = list(l = 50, r = 50, b = 50, t = 50))
  })
}

shinyApp(ui = ui, server = server)