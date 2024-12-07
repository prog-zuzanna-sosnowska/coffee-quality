library(dplyr)
library(ggplot2)
library(tidyverse)
library(patchwork)
library(countrycode)

data <- read.csv("arabica_data_cleaned.csv")
data[data == ""] <- NA

data_select <- data[c("Country.of.Origin", "Processing.Method", 
                      "Aroma", "Flavor", "Sweetness", "Aftertaste", "Acidity",
                      "altitude_mean_meters", "Total.Cup.Points")]

data_clean <- data_select %>%
  mutate(Processing.Method = factor(Processing.Method),)

view(data_clean)



data_clean$Continent <- countrycode(sourcevar = data_clean$Country.of.Origin,
                                    origin = "country.name",
                                    destination = "continent")

data_clean[is.na(data_clean$Continent) & !is.na(data_clean$Country.of.Origin),]$Continent <- "Americas"


view(data_clean$Continent)

