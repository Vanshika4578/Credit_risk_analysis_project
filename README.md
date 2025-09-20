## 📊 Credit Risk Analysis Project
## 📝 Overview

This project analyzes the German Credit Dataset to assess customer credit risk based on demographics, financial status, and loan details. The end-to-end workflow involves data cleaning in Excel, in-depth analysis with SQL, and building an interactive dashboard in Power BI to derive actionable business insights.

---

## 📂 Project Structure
CREDIT-RISK-ANALYSIS-PROJECT

### Data:
   └── Credit_risk_analysis_raw.csv        # Original dataset


### Excel:
   └── Credit_risk_analysis_cleaned.xlsx   # Cleaned dataset + credit scoring logic


### SQL:
   └── customer_database_analysis.sql      # SQL queries & analysis


### PowerBI:
   ├── Visual_analysis.pbix: Interactive Power BI dashboard
   └── Dashboard_screenshot.png: Snapshot of dashboard


### README.md: 
Project documentation

---

## 🛠 Tools Used
Excel → Data cleaning, credit scoring model, risk categorization.

SQL → Advanced queries (aggregations, CTEs, window functions, joins).

Power BI → Dashboard with interactive visuals to analyze credit trends.

--- 

## 📊 Stakeholder Insights

### 👔 For Bank Management (Strategic Level)

High-Risk customers borrow larger amounts → higher default exposure concentrated in a small group.

30–45 year olds are the bank’s largest borrower segment → strategy should focus on retaining this group while monitoring risk.

Owned housing customers are most stable, while renters show higher risk → housing type can be used in credit policy.

### 💰 For Risk & Compliance Teams

No checking account balance = strongest risk signal → policy can flag these cases for stricter checks.

Younger customers (<25) show higher risk concentration → require tighter eligibility filters.

Loan duration ≥48 months is linked to higher loan amounts → long-term lending increases exposure, needs stress testing.

### 🏦 For Lending Officers (Operational Level)

Savings and checking accounts are useful early indicators for assessing customer strength.

Medium Risk customers form the largest pool → opportunity to upsell smaller loans safely.

High-Risk customers taking big loans → require more frequent monitoring after disbursement.

---

## 📷 Dashboard Preview
![Dashboard Preview](./PowerBI/Dashboard_screenshot.png)

---

## 🙌 Acknowledgment

Dataset adapted from the German Credit Risk dataset.
Project prepared as part of my Data/Business Analyst portfolio.