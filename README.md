Online_Food_Delivery_Analysis_README.md


🍔 Online Food Delivery Analysis: Data-Driven Business Insights
🚀 Overview
This project performs an end-to-end analysis of an online food delivery dataset containing 100,000 orders and 25 original features.

The objective is to understand customer ordering behavior, delivery performance, restaurant performance, revenue, profitability, payment preferences, and cancellations using Python, MySQL/SQL, and Power BI.

The project covers the complete analytics workflow:

Data Collection → Data Understanding → Data Cleaning → EDA → Feature Engineering → SQL Analysis → Power BI Dashboard

🎯 Objectives

Perform data cleaning and preprocessing

Handle missing values using appropriate business and statistical methods

Detect and validate inconsistent values

Perform exploratory data analysis (EDA)

Analyze customer, order, restaurant, delivery, and financial performance

Create business-oriented features

Store and analyze cleaned data using MySQL

Perform business analysis using SQL

Build an interactive Power BI dashboard

Generate data-driven business insights

Document challenges, solutions, assumptions, and limitations

📁 Dataset Description

Records: 100,000 orders

Original features: 25

Domain: E-Commerce / Food & Beverage / Logistics / Customer Analytics / Business Intelligence

Main Data Areas

Customer details

Order information

Restaurant attributes

Cuisine information

Delivery performance

Payment information

Ratings

Cancellation information

Financial metrics

Important Features

Order_ID

Customer_ID

Customer_Age

Customer_Gender

City

Area

Restaurant_ID

Restaurant_Name

Cuisine_Type

Order_Date

Order_Time

Order_Day

Order_Status

Peak_Hour

Payment_Mode

Order_Value

Discount_Applied

Final_Amount

Delivery_Time_Min

Distance_km

Delivery_Rating

Restaurant_Rating

Cancellation_Reason

Profit_Margin

🧹 Data Cleaning & Preprocessing

The dataset contained realistic missing values and inconsistent records, so each field was handled based on its business meaning.

Missing Values

Filled selected categorical missing values with Unknown

Used median imputation for suitable numerical fields

Used business rules for fields such as Cancellation_Reason

Retained some missing values where reliable reconstruction was not possible

Important Cleaning Rules

Customer_Age → median imputation

Delivery_Time_Min → median imputation

Distance_km → median imputation

Order_Value → median imputation

Cancellation_Reason → Unknown for cancelled orders and Not Applicable for delivered orders

Restaurant_Rating > 5 → capped at 5

Final_Amount → reconstructed where Order_Value and Discount_Applied were available

Discount_Applied > Order_Value → corrected to maintain financial consistency

Validation

Final validation included:

Duplicate-row check

Range validation

Rating validation

Discount/order-value consistency

Negative final amount check

Verified:

Duplicate rows: 0
Discount > Order_Value: 0
Negative Final_Amount: 0
Rows: 100,000

⚠️ Data Quality Challenges & Solutions

1. Many Missing Values

Challenge: Several columns contained a large number of missing values.

Solution: Missing values were handled according to field type and business meaning instead of applying one method to every column.

2. Invalid Restaurant Ratings

Challenge: Some restaurant ratings were greater than the expected maximum of 5.

Solution: Ratings above 5 were capped at 5.

3. Inconsistent Financial Values

Challenge: Some records had Discount_Applied greater than Order_Value, which produced negative Final_Amount.

Solution: The discount was corrected to the maximum valid order value, making the resulting final amount zero.

4. Missing Final Amount

Challenge: Some Final_Amount values were missing.

Solution: Where possible:

Final_Amount = Order_Value - Discount_Applied

Missing final amounts were reconstructed only when both required inputs were available.

5. Unusable Order-Time Data

Challenge: The source Order_Time field was mostly 00:00 or missing.

Solution: The limitation was documented instead of creating a false hourly-demand pattern.

6. Statistical Outliers vs Business Validity

Challenge: IQR analysis identified many Customer_Age values as statistical outliers.

Solution: Ages within the valid business range of 18–60 were retained because they are legitimate values.

📊 Exploratory Data Analysis (EDA)

Analysis Performed

Order-status distribution

Customer-age distribution

Order-value distribution

Delivery-time distribution

Orders by city

Orders by cuisine

Payment-mode analysis

Weekday vs weekend order pattern

Peak-hour analysis

Order-value box plot

Delivery-time box plot

Distance vs delivery-time analysis

Delivery rating vs delivery time

Monthly order trend

Payment-mode share analysis

Visualizations

Bar Charts

Histograms

Line Charts

Pie / Donut Charts

Scatter Plots

Box Plots
🧮 Feature Engineering

The following analytical features were created:

Order Day Type

Weekday / Weekend

Peak Hour Indicator

Preserves the available source peak-hour information.

Profit Margin Percentage

Profit_Margin × 100

Delivery Performance

Fast   → ≤ 60 minutes
Normal → 61–120 minutes
Slow   → > 120 minutes

Customer Age Group

18–25
26–35
36–45
46–60

🗄️ MySQL & SQL Analysis

MySQL ONLY_FULL_GROUP_BY errors

Incorrect grouping of non-aggregated columns

Correcting cancellation-reason analysis

Building distance groups with CASE

Separating restaurant name and restaurant ID correctly in grouping

📈 Power BI Dashboard

An interactive Power BI dashboard was created with KPI cards, slicers, and analytical visuals.

KPI Cards

🛒 Total Orders

💰 Total Revenue

📊 Profit Margin %

🧾 Average Order Value

🛵 Average Delivery Time

❌ Cancellation Rate

⭐ Average Delivery Rating

Dashboard Filters

Date

City

Cuisine Type

Order Status

Dashboard Visuals

Revenue Per Month

Orders by City

Average Order Value by Cuisine

Top 10 Restaurants by Revenue

Order Status Distribution

Payment Mode Distribution

Delivery Performance

Cancellation Analysis

Distance vs Delivery Time by City

🔍 Key Insights

Order-Day Pattern

The dataset contains approximately:

71.37% Weekday orders

28.63% Weekend orders

Because there are five weekdays and two weekend days, these totals should not be interpreted as direct per-day demand rates.

Order Value

Minimum observed value: approximately 150

Maximum observed value: approximately 5,000

Median: approximately 1,197

Delivery Time

Minimum: approximately 20 minutes

Maximum: approximately 300 minutes

Median: approximately 120 minutes

Distance vs Delivery Time

The Python correlation between Distance_km and Delivery_Time_Min was approximately:

0.0022265

This indicates that the analyzed data does not show a clear linear relationship between the two variables.

Dashboard KPIs

Current verified dashboard values include:

Total Orders: 100K

Total Revenue: 140.69M

Average Order Value: 1.79K

Average Delivery Time: 124.98

Average Delivery Rating: 2.99

Profit Margin: 15.04%

💡 Business Interpretation

The analysis can support business questions related to:

Customer ordering behavior

Delivery efficiency

Restaurant performance

Revenue and profit

Discount performance

Cancellation patterns

Payment preferences

City and cuisine performance

The results should be interpreted together with the documented data-quality limitations.

✅ Conclusion

This project demonstrates a complete data analytics workflow from raw food-delivery data to business intelligence reporting.

Python was used for cleaning, preprocessing, EDA, and feature engineering. MySQL and SQL were used for structured business analysis. Power BI was used to create an interactive dashboard containing KPIs, filters, and analytical visuals.

The project also documents the challenges encountered during data preparation and visualization, along with the solutions implemented to maintain logical consistency and avoid unsupported assumptions.

👩‍💻 Project Deliverables

Python analysis / notebook

Cleaned dataset

SQL queries

MySQL database table

Power BI dashboard

GitHub README documentation