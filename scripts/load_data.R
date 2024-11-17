library(readr)

diabetes_data <- read_csv("data/diabetes.csv")
saveRDS(diabetes_data, "data/diabetes_data.RDS")