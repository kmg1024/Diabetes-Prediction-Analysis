library(dplyr)

diabetes_data_clean <- readRDS("data/diabetes_data_clean.RDS")

logistic_model <- glm(Outcome ~ ., data = diabetes_data_clean, family = binomial)

saveRDS(logistic_model, "scripts/logistic_model.RDS")