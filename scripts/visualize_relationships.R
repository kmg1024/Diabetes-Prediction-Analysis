library(ggplot2)
library(dplyr)

diabetes_data_clean <- readRDS("data/diabetes_data_clean.RDS")

glucose_plot <- ggplot(diabetes_data_clean, aes(x = factor(Outcome), y = Glucose, fill = factor(Outcome))) +
  geom_boxplot() +
  scale_fill_manual(values = c("#F8766D", "#00BFC4"), labels = c("No Diabetes", "Diabetes")) +
  labs(
    title = "Distribution of Glucose Levels by Diabetes Outcome",
    x = "Diabetes Outcome",
    y = "Glucose Level",
    fill = "Outcome"
  ) +
  theme_minimal()

ggsave("figures/glucose_boxplot.png", plot = glucose_plot)

bmi_plot <- ggplot(diabetes_data_clean, aes(x = factor(Outcome), y = BMI, fill = factor(Outcome))) +
  geom_boxplot() +
  scale_fill_manual(values = c("#F8766D", "#00BFC4"), labels = c("No Diabetes", "Diabetes")) +
  labs(
    title = "Distribution of BMI by Diabetes Outcome",
    x = "Diabetes Outcome",
    y = "Body Mass Index (BMI)",
    fill = "Outcome"
  ) +
  theme_minimal()

ggsave("figures/bmi_boxplot.png", plot = bmi_plot)
