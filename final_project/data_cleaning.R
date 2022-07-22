# Final Project -- Life Expectancy Data Cleaning

library(countrycode)
library(faraway)
library(readr)
library(tidyverse)

life <- read_csv("datasets/life_expectancy.csv")

# Clean column names
colnames(life) <- gsub("[[:space:]-]+", "_", tolower(colnames(life)), fixed = FALSE)
colnames(life) <- gsub("/", "_", colnames(life), fixed = TRUE)
life <- life %>% rename(
    perc_hc_spend = total_expenditure,
    hdi_income = income_composition_of_resources,
    )

# Find year with least amount of nulls
grp <- life %>% mutate(null_any = (is.na(life_expectancy) | is.na(schooling) | is.na(perc_hc_spend))) %>% group_by(year, null_any) %>% summarise(n = n())

# Only use most recent year of data
# life <- life %>% filter(year == max(year) - 1)

# Attach continent/regional info
life$continent <- as.factor(
    countrycode(
        sourcevar = life$country,
        origin = "country.name",
        destination = "continent"
    )
)

# Combine Asia and Oceania
life$continent <- fct_collapse(life$continent, "Asia/Oceania" = c("Asia", "Oceania"))

# Set additional stuff as factor
life$status <- as.factor(life$status)

# # Cols to keep
# colstokeep <- c(
#     "country",
#     "year",
#     "life_expectancy",
#     "continent",
#     "status",
#     "adult_mortality",
#     "bmi",
#     "thinness_1_19_years",
#     "polio",
#     "perc_hc_spend",
#     "schooling",
#     "hdi_income"
# )
# life <- life %>% select(colstokeep)

# # Find null values
# n_nulls <- sapply(life, function(x) sum(is.na(x)))
# null_cols <- labels(n_nulls[n_nulls > 0])
# 
# nulls <- life[rowSums(is.na(life)) > 0,]  # 12 countries with at least 1 null
# 
# # Fill null values with continent's median value
# for (col in null_cols){
#     reg_medians <- life %>%
#         select(continent, .data[[col]]) %>%
#         group_by(continent) %>%
#         summarise(median = median(.data[[col]], na.rm = TRUE))
# 
#     life <- life %>%
#         # select(continent, .data[[col]]) %>%
#         left_join(reg_medians, by = "continent") %>%
#         mutate("{col}" := coalesce(.data[[col]], median)) %>%
#         select(-c(median))
# }

# sapply(life, function(x) sum(is.na(x)))

# Write out clean dataset to .csv
write_csv(
    life,
    "datasets/life_expectancy_clean.csv"
)
