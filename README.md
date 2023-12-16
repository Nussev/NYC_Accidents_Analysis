# <p align='center'>Analysis of New York City Traffic Accidents (Jan 2020 - Aug 2023)</p>

## Overview:

## General Process
* I accessed the dataset from Maven Analytics free Dataset collection (NYC Traffic Accidents)
* Used SQL Server Management Studio (SSMS) to perform analysis and understand the dataset
* After having a better understanding of the dataset, I used Tableau to create visualizations/dashboards to visualize the findings.

## Description
The NYC Traffic Accidents table contains all motor vehicle collisions reported by NYPD from January 2021 to April 2023. Each row represents a single collision and includes details such as vehicles, victims involved, contributing factors (Speeding, Texting, etc), date, time, and location (borough, street name, latitude/longitude)

Dataset: https://mavenanalytics.io/data-playground?accessType=open&order=-fields.dateUpdated 

## Questions to Analyze
I used the recommended analysis questions to guide my findings:
1. On which particular streets were the most accidents reported?
2. What was the most common contributing factor to the accidents reported? What about fatal accidents?
3. What Streets and Boroughs experienced the most accidents?
4. Compare the % of total accidents by month.
5. Break down the frequency by day of week and hour of day. When do accidents occur most frequently?

## Results
I used MS SQL Server initially to get a general idea of the data, as well as to see what are some of the leading results in certain columns. 
Here I provided some of the SQL queries I ran to analyze the data and the Time-Series Analysis I condcuted in Tableau as well.
Here are the links to the full SQL analysis and Tableau workbook.

A. Total Accidents by Year:

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Query%20Images/%231_Total_Accidents.png)

B. Number of Accidents per Borough:

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Query%20Images/%232_Borough_Accidents.png)

C. Top 10 streets with the most accidents

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Query%20Images/%234_Top10_streets.png)

D. What are the different levels of severity and distribution amongst them?

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Query%20Images/%238_pt2_category_query.png)


A. Time-Series Analysis


## Insights

## Recommendations

## Next Steps


