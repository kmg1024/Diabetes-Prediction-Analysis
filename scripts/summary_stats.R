library(dplyr)
library(knitr)
library(kableExtra)

diabetes_data_clean <- readRDS("../data/diabetes_data_clean.RDS")

summary_stats <- diabetes_data_clean %>%
  select(Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age) %>%
  summary()

summary_df <- as.data.frame(summary_stats)

kable(summary_df, format = "latex", caption = "Summary Statistics of Predictor Variables") %>%
  kable_styling(full_width = FALSE, position = "center") %>%
  save_kable("../tables/summary_statistics.tex")