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

Here I provided some of the SQL queries I ran to analyze the data.
Please refer to the link below to see my full analysis and descriptions on how I came to answer specific questions.
https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/NYC_Analysis.sql 


A. Total Accidents by Year:

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Query%20Images/%231_Total_Accidents.png)

B. Number of Accidents per Borough:

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Query%20Images/%232_Borough_Accidents.png)

C. Top 10 streets with the most accidents

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Query%20Images/%234_Top10_streets.png)

D. What are the different levels of severity and distribution amongst them?

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Query%20Images/%238_pt2_category_query.png)


1. Time-Series Analysis

![text](https://github.com/Nussev/NYC_Accidents_Analysis/blob/main/Tableau%20Charts/Time-Series.png)


## Insights

1. The majority of accidents occurred in the from Janaury - March (28.88%). It is important to note that this number is not fully up to date since data was only derived into April of 2023.
2. Accidents and Injuries occurred most often from 4pm to 5pm, with unusual spikes at 12am & 8am.
3. Brooklyn had the largest number of accdidents (76,416), with Queens having the second largest number of accidents (63,751).
4. 91.38% of all accidents were classified as 'Low' severity, only having 0 to 1 victim (Injured or Killed) in the accident.

## Recommendations

## Next Steps


