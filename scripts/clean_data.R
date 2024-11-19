library(dplyr)

diabetes_data <- readRDS("../data/diabetes_data.RDS")

columns_with_zero_invalid <- c("Glucose", "BloodPressure", "SkinThickness", "Insulin", "BMI")

diabetes_data_clean <- diabetes_data %>%
  mutate(across(all_of(columns_with_zero_invalid), ~ ifelse(. == 0, NA, .))) %>%
  mutate(
    Glucose = ifelse(is.na(Glucose), median(Glucose, na.rm = TRUE), Glucose),
    BloodPressure = ifelse(is.na(BloodPressure), median(BloodPressure, na.rm = TRUE), BloodPressure),
    SkinThickness = ifelse(is.na(SkinThickness), median(SkinThickness, na.rm = TRUE), SkinThickness),
    Insulin = ifelse(is.na(Insulin), median(Insulin, na.rm = TRUE), Insulin),
    BMI = ifelse(is.na(BMI), median(BMI, na.rm = TRUE), BMI)
  )

saveRDS(diabetes_data_clean, "../data/diabetes_data_clean.RDS")
