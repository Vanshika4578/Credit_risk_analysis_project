# Credit Risk Decisioning Analysis (Excel + SQL)

## 📌 Project Overview
This project simulates a **credit risk scoring and decisioning system** using Excel and SQL.  
The goal is to classify loan applicants into **Low, Medium, or High Risk** categories and analyze repayment outcomes to support better credit decisions.

## 🔧 Tools & Techniques
- **Excel** → Lookup tables, weighted scoring model, pivot tables, conditional formatting  
- **SQL** → Joins, Common Table Expressions (CTEs), Window Functions, and aggregation for portfolio-level insights  

## 📊 Key Features
- Designed a **credit scoring model in Excel** to classify customers into risk groups  
- Built **pivot tables** to analyze risk across age groups, loan amounts, purposes, and housing status  
- Created a **repayments table** (simulated) and used **SQL joins** to validate risk scoring against repayment outcomes  
- Applied **window functions** to calculate default percentages, rank customers, and segment portfolios  

## 📈 Sample Insights
- High Risk customers under 25 showed a **50%+ default rate**  
- Medium Risk customers had ~20% default rate  
- Low Risk customers showed **<5% default rate**  
- Larger loan amounts (>10,000) were disproportionately high risk  

## 📂 Project Structure
Credit_Risk_Analysis/
│── data/ # Dataset (Credit risk CSV)
│── excel/ # Excel scoring model with risk classification
│── sql/ # SQL scripts for analysis
└── README.md # Documentation


## 🚀 Next Steps
- Extend analysis with **Power BI dashboards** for interactive visualization  
- Explore **machine learning models** to automate credit scoring  
