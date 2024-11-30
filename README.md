# Diabetes Prediction Analysis

## Project Overview

This project aims to diagnostically predict whether a patient has diabetes based on various diagnostic measurements. The dataset used originates from the **National Institute of Diabetes and Digestive and Kidney Diseases (NIDDK)**. All patients in this dataset are females, at least 21 years old, and of Pima Indian heritage.

## Dataset Description

- **Pregnancies**: Number of pregnancies the patient has had.
- **Glucose**: Plasma glucose concentration a 2 hours in an oral glucose tolerance test.
- **BloodPressure**: Diastolic blood pressure (mm Hg).
- **SkinThickness**: Triceps skin fold thickness (mm).
- **Insulin**: 2-Hour serum insulin (mu U/ml).
- **BMI**: Body mass index (weight in kg/(height in m)^2).
- **DiabetesPedigreeFunction**: A function which scores the likelihood of diabetes based on family history.
- **Age**: Age of the patient (years).
- **Outcome**: Class variable (0: No diabetes, 1: Diabetes)

## Analysis Objectives

1. **Explore** the distribution and relationships of the predictor variables.
2. **Summarize** key statistics to understand the dataset.
3. **Visualize** the relationship between key variables and the diabetes outcome.
4. **Clean and preprocess** the data to handle anomalies and missing values.
5. **Build and evaluate** a logistic regression model to predict diabetes outcomes.

## Project Structure

Diabetes-Prediction-Analysis/
├── data/
│   ├── diabetes_fake.csv
│   ├── diabetes_data_clean.RDS
│   └── diabetes_data.RDS           # Real dataset (not included for privacy)
├── models/
│   └── logistic_model.RDS
├── scripts/
│   ├── create_fake_data.R
│   ├── load_data.R
│   ├── clean_data.R
│   ├── summary_stats.R
│   ├── correlation_analysis.R
│   ├── visualize_relationships.R
│   ├── predictive_modeling.R
│   └── model_evaluation.R
├── figures/
│   ├── correlation_heatmap.png
│   ├── glucose_boxplot.png
│   └── bmi_boxplot.png
├── tables/
│   ├── summary_statistics.md
│   ├── confusion_matrix.md
│   └── model_evaluation.md
├── report/
│   ├── final_report.Rmd
│   └── final_report.pdf
├── Makefile
├── README.md
├── renv.lock
└── .gitignore

### Code Locations

- **Creating the Summary Statistics Table**: `scripts/summary_stats.R`
- **Creating the Correlation Heatmap**: `scripts/correlation_analysis.R`
- **Creating Visualizations (Boxplots)**: `scripts/visualize_relationships.R`
- **Building the Logistic Regression Model**: `scripts/predictive_modeling.R`
- **Evaluating the Model's Performance**: `scripts/model_evaluation.R`
- **Generating Fake Data**: `scripts/create_fake_data.R`
- **Loading Data**: `scripts/load_data.R`
- **Cleaning Data**: `scripts/clean_data.R`

### Directories

- **figures/**: Stores all generated plots and figures.
- **tables/**: Contains markdown files for generated tables.
- **report/**: Houses the R Markdown report and the compiled PDF.

## Data Information

- **Real Dataset**: `data/diabetes.csv`
  - Contains real patient data used for analysis.
  - **Note**: Due to privacy restrictions, ensure that this file does not contain any sensitive information before sharing publicly.
  
- **Fake Dataset**: `data/diabetes_fake.csv`
  - A fabricated dataset with the same structure as the real data but with made-up values to preserve privacy.
  - Use this dataset if you cannot share the real data publicly.

## Requirements

### Software

- **R** (version 4.x)
- **RStudio** (optional)
- **Make** (for automating report generation)

### R Packages

- `ggplot2`
- `dplyr`
- `knitr`
- `readr`
- `kableExtra`
- `ggcorrplot`
- `pROC`
- `renv`

## Installation

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your_username/Diabetes-Prediction-Analysis.git
   cd Diabetes-Prediction-Analysis

2. **Install Required R Packages**

    ```bash
    make install_packages
    
3. **Restore the Package Environment**

    ```bash
    make install

## Generating the Report

1. Run the Makefile to Generate the Report

    ```bash
    make report

2. Open report/final_report.pdf to view the comprehensive analysis and model evaluation.

## Cleaning Generated Files

    ```bash
    make clean
    
## Synchronizing the Package Environment

1. Install Required Packages

    ```bash
    make install_packages

2. Restore the Environment

    ```bash
    make install

## Contributing

1. Fork the Repository

2. Create a New Branch

    ```bash
    git checkout -b feature/YourFeature
    
3. Commit Your Changes 

    ```bash
    git commit -m 'Add some feature'

4. Push to the Branch
    
    ```bash
    git push origin feature/YourFeature

5. Open a Pull Request

## Contact

For any questions or further information, please contact:

Mi Yan
Email: myan42@emory.edu