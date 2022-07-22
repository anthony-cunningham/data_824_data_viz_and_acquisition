#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# See here for tips on creating functions using tidyverse stuff:
#
#   https://cran.r-project.org/web/packages/dplyr/vignettes/programming.html

# library(shiny)
# library(plotly)
# library(readr)
# library(ggplot2)
# library(tidyverse)
# 
# # Load data
# life <- read_csv("../datasets/life_expectancy_clean.csv")
# 
# life %>%
#     group_by(year) %>%
#     summarise(
#         mean_life_expectancy = mean(life_expectancy, na.rm = TRUE),
#         median_life_expectancy = median(life_expectancy, na.rm = TRUE)
#         )
# 
# get_aggs_by_year <- function(data, var, grouping_var){
#     if(missing(grouping_var)){
#         agg <- data %>%
#             group_by(year) %>%
#             summarise(
#                 mean = mean({{ var }}, na.rm = TRUE),
#                 median = median({{ var }}, na.rm = TRUE)
#             )
#     }
#     else{
#         agg <- data %>%
#             group_by(year, {{ grouping_var }}) %>%
#             summarise(
#                 mean = mean({{ var }}, na.rm = TRUE),
#                 median = median({{ var }}, na.rm = TRUE)
#             )
#     }
#     
#     return(agg)
# }
# 
# life %>% get_aggs_by_year(var = life_expectancy, grouping_var = continent)
# 
# # Plot life expectancy across time
# data_p <- life %>% ggplot(aes(x=year, y=life_expectancy, color=country)) +
#     geom_line(alpha = 0.3) + 
#     geom_point(alpha = 0.3) +
#     scale_colour_manual(values = rep(c("#749AAC"), times = length(unique(life$country)))) +
#     scale_x_continuous(n.breaks = length(unique(life$year))) +
#     theme(
#         legend.position="none",
#         axis.text.x  = element_text(angle=45)
#         ) +
#     xlab("Year") +
#     ylab("Life Expectancy")
# 
# 
# p <- data_p +
#     stat_summary(fun="mean", geom="line", na.rm=TRUE, size=1.25, colour="black") +
#     stat_summary(fun="mean", geom="point", na.rm=TRUE, size=2.5, colour="black") +
#     stat_summary(fun="median", geom="line", na.rm=TRUE, size=1.25, colour="red") +
#     stat_summary(fun="median", geom="point", na.rm=TRUE, size=2.5, colour="red")
# 
# ggplotly(p)
# 
# 
# plot_over_time_by_country <- function(data, var="life_expectancy", agg = "mean"){
#     # check datatype of plotting variable
#     var_type <- typeof(data[[var]])
#     stopifnot(
#         paste0("Plotting variable is required to be numeric. Given input '", var, "' is of type '", var_type, "'."),
#         var_type != "double"
#         )
# 
#     var_disp <- str_to_title(str_replace(var, "_", " "))
# 
#     # Create plot object
#     p <- ggplot(data = data, aes_string(x="year", y=as.name(var), color="country")) +
#         geom_line(alpha = 0.3) + 
#         geom_point(alpha = 0.3) +
#         scale_colour_manual(values = rep(c("#749AAC"), times = length(unique(data$country)))) +
#         scale_x_continuous(n.breaks = length(unique(data$year))) +
#         theme(
#             legend.position="none",
#             axis.text.x  = element_text(angle=45)
#         ) +
#         xlab("Year") +
#         ylab(var_disp) +
#         ggtitle(paste0(var_disp, " Across Time (w/ ", str_to_title(agg), " Trend)")) +
#         stat_summary(fun=agg, geom="line", na.rm=TRUE, size=1.25, colour="black") +
#         stat_summary(fun=agg, geom="point", na.rm=TRUE, size=2.5, colour="black")
# 
#     # Output to plotly
#     ggplotly(p)
# }
# 
# plot_over_time_by_country(life, var = "status", agg = "median")
# 
# # Define function for getting categories of a column
# get_categories <- function(data, var="continent"){
#     cats <- unique(data[[var]])
#     return(cats)
# }
# 
# cont <- get_categories(life, var="continent")
# 
# # Define function for filtering to specific category
# filter_data <- function(data, var="continent", group="Americas"){
#     filt_data <- data %>% filter(.data[[var]] == group)
#     return(filt_data)
# }
# 
# am <- filter_data(life)
# 
# life %>% filter(continent == 'Americas')
# 
# # Flow: If user wants subset of data (from continent, country or status), have them pick
# # using available categories (get_categories), then filter data (filter_data) then display
# 
# # Get measures that we should use for trending
# measures <- colnames(life %>% select(-year) %>% select(where(is.numeric)))

library(shiny)
library(plotly)
library(readr)
library(ggplot2)
library(ggExtra)
library(tidyverse)

# Create functions
plot_over_time_by_country <- function(data, var="life_expectancy", agg = "mean"){
    # check datatype of plotting variable
    var_type <- typeof(data[[var]])
    if(var_type != "double"){
        stop(paste0("Plotting variable is required to be numeric. Given input '", var, "' is of type '", var_type, "'."))
    }

    var_disp <- str_to_title(str_replace_all(var, "_", " "))
    
    # Create plot object
    p <- ggplot(data = data, aes_string(x="year", y=as.name(var), color="country")) +
        geom_line(alpha = 0.3) + 
        geom_point(alpha = 0.3) +
        scale_colour_manual(values = rep(c("#A8E0E5"), times = length(unique(data$country)))) +
        scale_x_continuous(n.breaks = length(unique(data$year))) +
        scale_y_continuous(limits=c(
            min(0, min(data[[var]])),
            (max(data[[var]] + 0.2*(max(data[[var]] - min(data[[var]])))))
        )) +
        theme(
            legend.position="none",
            axis.text.x  = element_text(angle=45)
        ) +
        xlab("Year") +
        ylab(var_disp) +
        ggtitle(paste0(var_disp, " Across Time (w/ ", str_to_title(agg), " Trend)")) +
        stat_summary(fun=agg, geom="line", na.rm=TRUE, size=1.25, colour="black") +
        stat_summary(fun=agg, geom="point", na.rm=TRUE, size=2.5, colour="black")
    
    return(p)
}

# Define function for getting categories of a column
get_categories <- function(data, var="continent"){
    cats <- unique(data[[var]])
    return(cats)
}

# Define function for filtering to specific category
filter_data <- function(data, var="continent", group="Americas"){
    filt_data <- data %>% filter(.data[[var]] == group)
    return(filt_data)
}

plot_scatter <- function(data, xvar, yvar='life_expectancy'){
    xvar_disp <- str_to_title(str_replace_all(xvar, "_", " "))
    yvar_disp <- str_to_title(str_replace_all(yvar, "_", " "))
    
    # Filter out rows with missing data
    data <- data %>% drop_na(.data[[xvar]], .data[[yvar]])
    
    # Calculate correlation
    rho <- round(cor(data[[xvar]], data[[yvar]], use="pairwise.complete.obs"), 3)
    r.squared <- round(rho^2, 3)
    
    p <- data %>%
        ggplot(aes_string(x=xvar, y=yvar)) +
        geom_point(aes(text=country, group=year), shape = 1, alpha = 0.2) +
        geom_smooth(method=lm, color="#0A36BE", fill="#A3B5EC", se=TRUE) +
        xlab(xvar_disp) +
        ylab(yvar_disp) +
        ggtitle(paste0(xvar_disp, " vs ", yvar_disp,
                       " (r = ", rho, " / R^2 = ", r.squared, ")")
                ) +
        theme_minimal()

    return(p)
}

# Load data
life <- read_csv("../datasets/life_expectancy_clean.csv", show_col_types = FALSE)

# Get measures that we should use for trending
measures <- colnames(life %>% select(-year) %>% select(where(is.numeric)))

cat_vars <- colnames(life %>% select(where(is.character)))

years <- sort(unique(life$year), decreasing = TRUE)

# Define UI for application
ui <- fluidPage(
    
    # Application title
    titlePanel("Country-Level Exploration"),

    tabsetPanel(
        tabPanel(
            title="Bivariate Relationships",
            
            # 3 user inputs at the top
            fluidRow(
                column(3, offset = 2,
                       # Input: Y-Axis Variable
                       selectInput(inputId = "yvar",
                                   label = "Y-Variable:",
                                   choices = measures,
                                   selected = "life_expectancy")
                ),
                column(3, offset = 2,
                       # Input: X-Axis Variable
                       selectInput(inputId = "xvar",
                                   label = "X-Variable:",
                                   choices = measures,
                                   selected = "adult_mortality")
                )
            ),
            
            hr(),
            
            plotlyOutput("scatter_plot")
        ),
        tabPanel(
            title="Country-Level Trends Across Time",

            # 3 user inputs at the top
            fluidRow(
                column(3, offset = 1,
                    # Input: Selector for choosing variable to trend ----
                    selectInput(inputId = "trend_var",
                                label = "Choose a measure:",
                                choices = measures,
                                selected = "life_expectancy")
                ),
                column(3, offset = 1,
                       # Input: Selector for choosing category var to filter on (if any) ----
                       selectInput(inputId = "cat_filter",
                                   label = "Pick a categorical measure to filter on:",
                                   choices = c(cat_vars, "none"),
                                   selected = "none"),
                       # Conditional input if user wants to filter to specific category ----
                       uiOutput("category")
                ),
                column(3, offset = 1,
                       # Input: What type of aggregation to use on trend plot? ----
                       radioButtons(inputId = "agg",
                                    label = "Pick an aggregate function to use:",
                                    choices = c("mean", "median"),
                                    selected = "median")
                )
            ),
            
            hr(),
            
            plotlyOutput("trend_plot")
        )
    )
)


# Define server logic
server <- function(input, output) {
    df <- life  # re-instantiate dataset
    
    output$scatter_plot <- renderPlotly({
        # Draw scatter plot
        ggplotly(plot_scatter(data=df,
                              xvar=input$xvar,
                              yvar=input$yvar
                              )
                 )
    })
        
    observe({
        # If user wants to filter on category, do that here...
        if(input$cat_filter != "none"){
            output$category <- renderUI({
                    selectInput(inputId = "sub_cat",
                                label = "Pick a category to filter on:",
                                choices = unique(df[[input$cat_filter]]))
            })
        }
    })
        
    output$trend_plot <- renderPlotly({

        # Check if user wants to filter to sub-category
        if(!is.null(input$sub_cat)){
            df <- filter_data(df,
                              var=input$cat_filter,
                              group=input$sub_cat)
        }
        
        # Draw trend plot
        ggplotly(plot_over_time_by_country(df, var = input$trend_var, agg = input$agg))
        
    })
}


# Create Shiny App
shinyApp(ui=ui, server=server)