library(dplyr)
library(ggplot2)
library(tidyverse)
library(patchwork)

data <- read.csv("arabica_data_cleaned.csv")
data[data == ""] <- NA

data_select <- data[c("Country.of.Origin", "Processing.Method", 
                      "Aroma", "Flavor", "Sweetness", "Aftertaste", "Acidity",
                      "altitude_mean_meters", "Total.Cup.Points")]

data_clean <- data_select %>%
  mutate(Processing.Method = factor(Processing.Method),)

# view(data_clean)

subset(data_clean, Flavor < 5 | is.na(Flavor))
