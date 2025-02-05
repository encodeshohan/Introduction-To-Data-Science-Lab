# 💰 Loan Approval Data Preprocessing and Analysis

## 📌 Overview  
This project focuses on preprocessing and analyzing a loan approval dataset containing 14 attributes. It involves handling missing values, removing duplicates and outliers, normalizing data, encoding categorical variables, and addressing class imbalance. The final processed dataset is prepared for further machine learning applications.  

## 📂 Dataset Description  
The dataset consists of **201 instances** and **14 attributes**, including:  
- **Demographic Information**: Age, Gender, Education, Employment Experience, Home Ownership  
- **Financial Details**: Annual Income, Credit Score, Loan Amount, Loan Interest Rate, Loan Purpose  
- **Historical Data**: Credit History Length, Previous Loan Defaults  
- **Target Variable**: Loan Approval Status  

## 🔧 Preprocessing Steps  
✔ **Loading & Exploring Data**: Checking structure, identifying missing values, and summarizing statistics.  
✔ **Removing Duplicates**: Ensuring unique entries using `distinct()` function.  
✔ **Handling Invalid Values**: Correcting inconsistencies in categorical attributes (e.g., Home Ownership).  
✔ **Encoding Categorical Variables**: Converting categories into numerical values for analysis.  
✔ **Handling Missing Values**: Using mean imputation and removal of incomplete entries.  
✔ **Detecting & Removing Outliers**: Applying **Interquartile Range (IQR)** to detect and eliminate extreme values.  
✔ **Normalization**: Scaling income using **Min-Max Normalization**.  
✔ **Reverting Encoded Data**: Converting numerical data back into categorical form for interpretation.  
✔ **Statistical Analysis**: Computing **Mean, Median, Mode, Variance, Standard Deviation**, and **Range** for key attributes.  
✔ **Handling Class Imbalance**: **Oversampling** the minority class using the `ROSE` package.  

## 📜 Technologies Used  
- **R Language**  
- **Libraries**: `readxl`, `dplyr`, `ROSE`  

## 📊 Key Results  
- Dataset is **cleaned and structured** for predictive modeling.  
- Categorical variables are properly **encoded** and **decoded**.  
- **Class imbalance** is effectively handled, ensuring better model performance.  

## 🚀 Future Scope  
- Feature Engineering & Selection  
- Implementing ML Models (Logistic Regression, Decision Trees, etc.)  
- Model Evaluation & Optimization  
