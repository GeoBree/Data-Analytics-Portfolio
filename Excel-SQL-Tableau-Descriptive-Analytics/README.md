# Descriptive Analytics Project using Excel, SQL and Tableau

## Project Overview

This project involved working with simulated data for a fictitious supermarket. 2Market is a global supermarket which sells products online and in-store. It was my aim to help it understand its customers' purchase behaviour. To support 2Market, I analysed the data using Excel and SQL and created a dashboard in Tableau that included key metrics to inform decision-making.

## Project Context

This project was completed as part of the LSE Data Analytics Career Accelerator. A simulated business scenario and datasets were provided as the starting point for the project, which I then used to conduct and document my own analysis.

As part of the assignment, I was required to produce a technical report documenting the analysis and create a video presentation communicating the findings and recommendations.

## Objectives

2Market wants to understand:

- The demographics of its customers
- Which advertising channels seem to be the most effective
- Which products seem to sell the best and whether this varies by demographic

## Tools Used

- Microsoft Excel — data cleaning, preparation and exploratory analysis
- PostgreSQL and pgAdmin — querying and analysing data using SQL
- Tableau — data preparation, visualisation and interactive dashboard development

## Data Preparation

Before I could begin the analysis, I used Excel to prepare the data. I loaded the CSV files into Excel and created copies of the raw data to avoid mistakes being baked into the analysis. The data preparation techniques included:

- Identifying missing data and categorising it as 'NA'
- Removing unnecessary white space
- Correctly capitalising names
- Correcting data input errors, such as spelling mistakes
- Using XLOOKUP to standardise values across the datasets, such as marital status
- Creating new variables, such as age, by using formulae across columns
- Improving variable names
- Ensuring the data was in the correct format, such as date or currency
- Removing duplicates

## Exploratory Data Analysis

After preparing the data, some exploratory analysis was conducted to understand and validate the data. This included:

- Using MIN and MAX formulae on numerical data to ascertain the range of the data
- Using COUNT formulae to determine the number of observations
- Checking the unique values within categorical variables
- Creating charts, such as scatterplots, to identify potential outliers
- Using PivotTables to assess aggregated data across categories
- Using the PivotTables to create charts of the aggregated data

The exploratory analysis identified some significant potential outliers, including an unusually high income and several customers with ages above 125. These were retained in the dataset but were considered a limitation when interpreting the results.

## SQL Analysis

The two datasets were imported into a PostgreSQL database and analysed using pgAdmin. I created two tables and defined the appropriate columns and data types.

SQL was then used to analyse the advertising data. This included:

- Joining the two datasets using the customer ID
- Using aggregate functions such as SUM()
- Grouping results by country
- Comparing the success of different social media advertising channels across countries

## Tableau Dashboard

The cleaned data was loaded into Tableau and joined with the advertising dataset. Further data preparation and analysis included:

- Creating a left join between the marketing and advertising datasets
- Pivoting the spending data from wide to long format
- Creating calculated fields to analyse the success of different advertising channels

I then created an interactive dashboard to present the results of the analysis. The dashboard included:

- Headline KPIs to provide an overview of key metrics
- Bar charts to compare results across different categories
- Filters for country and marital status to allow more granular analysis
- Filters to compare the success of individual advertising channels
- An accessible colour palette to make the dashboard easier to interpret

## Key Findings

The analysis identified several patterns in customer purchasing behaviour and advertising performance:

- Spain showed particularly strong customer engagement with 2Market's advertising campaigns
- South Africa showed potential for further growth based on the number of successful advertising interactions
- Bulkmail generated the greatest spending associated with successful advertising interactions
- Brochure advertising received fewer responses but had a relatively high success rate of 25%
- Facebook and Instagram appeared more effective than Twitter when comparing the social media advertising channels
- Customers within the 'Partner' marital status category showed relatively high engagement and spending
- Alcohol was the highest-spending product category when purchasing behaviour was compared across country and marital status

## Recommendations

Based on the findings of the analysis:

- Consider increasing marketing activity within South Africa to capitalise on its potential for growth
- Continue to use bulkmail as an important advertising channel due to the spending associated with successful interactions
- Consider the potential of brochure advertising despite its lower number of responses, due to its relatively high success rate
- Prioritise Facebook and Instagram over Twitter when using social media advertising
- Consider targeting customers within the 'Partner' demographic due to their higher engagement and spending
- Explore targeted Facebook advertising towards single customers in South Africa

## Limitations

The analysis was based on simulated customer data and therefore the findings should be considered within the context of the project.

Several unusual values were identified during exploratory analysis, including implausible customer ages and an unusually high income. These records were retained in the analysis and therefore may have influenced some of the results.

The advertising data only provides information about customers contained within the 2Market dataset. This limits the ability to establish a strong relationship between advertising exposure and purchasing behaviour.

## Project Files

[View 2Market Analysis Technical Report](2Market-Technical-Report.pdf)
[View 2Market Dashboard](2Market-Dashboard.twb)
[View 2Market SQL Queries](2Market-Analysis.sql)
[View 2Market Analysis Presentation Slide Deck](2Market-Presentation-Slide-Deck.pdf)

