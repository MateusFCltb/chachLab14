#install.packages("ggplot2")
#install.packages("gridExtra")

library(ggplot2)
library(gridExtra)

getwd()

## load data
WASDE <- read.csv("source_data/WASDE.csv")
soybean_price_monthly <- read.csv("source_data/soybeans_prices_monthly.csv")
CPI <- read.csv("source_data/CPI.csv")

## check

str(WASDE)

############### 

#Run all scripts
source("source_data/data_computations.R")
source("source_data/graph_funcs.R")
source("source_data/visualizations.R")
