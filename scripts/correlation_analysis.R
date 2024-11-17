library(ggcorrplot)
library(dplyr)

diabetes_data_clean <- readRDS("data/diabetes_data_clean.RDS")

cor_matrix <- cor(diabetes_data_clean %>% select(-Outcome))

ggcorrplot(cor_matrix, 
           method = "circle", 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           colors = c("#6D9EC1", "white", "#E46726"),
           title = "Correlation Heatmap of Predictor Variables",
           ggtheme = theme_minimal())

ggsave("figures/correlation_heatmap.png")