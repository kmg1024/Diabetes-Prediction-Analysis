library(dplyr)
library(knitr)
library(kableExtra)
library(pROC)

diabetes_data_clean <- readRDS("../data/diabetes_data_clean.RDS")
logistic_model <- readRDS("../scripts/logistic_model.RDS")

pred_probs <- predict(logistic_model, type = "response")

pred_classes <- ifelse(pred_probs >= 0.5, 1, 0)

conf_matrix <- table(Predicted = pred_classes, Actual = diabetes_data_clean$Outcome)

accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)

kable(conf_matrix, format = "latex", caption = "Confusion Matrix") %>%
  kable_styling(full_width = FALSE, position = "center") %>%
  save_kable("../tables/confusion_matrix.tex")

roc_obj <- roc(diabetes_data_clean$Outcome, pred_probs)
auc_value <- auc(roc_obj)

png("../figures/roc_curve.png", width = 800, height = 600)
plot(roc_obj, col = "#00BFC4", main = "ROC Curve for Logistic Regression Model")
abline(a = 0, b = 1, lty = 2, col = "red")
legend("bottomright", legend = paste("AUC =", round(auc_value, 3)), col = "#00BFC4", lwd = 2)
dev.off()

writeLines(c(
  paste("**Accuracy:**", round(accuracy * 100, 2), "%"),
  paste("**AUC:**", round(auc_value, 3))
), "../tables/model_evaluation.md")