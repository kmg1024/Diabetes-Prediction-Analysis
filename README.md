correlation_analysis.R: Correlation matrix and heatmap.
visualize_relationships.R: Creating boxplots and other visualizations.
predictive_modeling.R: Building the logistic regression model.
model_evaluation.R: Evaluating the model's performance.
figures/: Stores all generated plots and figures.

tables/: Contains markdown files for generated tables.

report/: Houses the R Markdown report and the compiled PDF.

Makefile: Automates the process of building the final report.

README.md: Project documentation.

.gitignore: Specifies files and directories to ignore in Git.

Code Locations
Creating the Summary Statistics Table: scripts/summary_stats.R
Creating the Correlation Heatmap: scripts/correlation_analysis.R
Creating Visualizations (Boxplots): scripts/visualize_relationships.R
Data Information
Real Dataset: data/diabetes.csv
Contains real patient data used for analysis. Due to privacy restrictions, ensure that this file does not contain any sensitive information before sharing publicly.

Fake Dataset: data/diabetes_fake.csv
A fabricated dataset with the same structure as the real data but with made-up values to preserve privacy. Use this dataset if you cannot share the real data publicly.

Requirements
Software:

R (version 4.x)
RStudio (optional)
Make (for automating report generation)
R Packages:

ggplot2
dplyr
knitr
readr
kableExtra
ggcorrplot
pROC
Contributing
Contributions are welcome! Please follow these steps to contribute:

Fork the repository.
Create a new branch (git checkout -b feature/YourFeature).
Commit your changes (git commit -m 'Add some feature').
Push to the branch (git push origin feature/YourFeature).
Open a Pull Request.
Contact
For any questions or further information, please contact:

Mi Yan
Email: myan42@emory.edu