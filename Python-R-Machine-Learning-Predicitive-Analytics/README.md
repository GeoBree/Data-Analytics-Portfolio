# Predictive Analytics and Machine Learning Project using Python and R

## Project Overview

This project involved analysing customer data for Turtle Games, a fictitious games manufacturer and retailer with a global customer base. The aim was to use predictive analytics and machine learning techniques to better understand customer behaviour and identify opportunities to improve customer loyalty and sales performance.

Python and R were used to explore the data, build statistical and machine learning models, identify different groups of customers and analyse customer reviews.

As part of the assignment, I was required to produce a technical report documenting the analysis and create a video presentation communicating the findings and recommendations.

## Project Context

This project was completed as part of the LSE Data Analytics Career Accelerator. A simulated business scenario and datasets were provided as the starting point for the project, which I then used to conduct and document my own analysis.

As part of the assignment, I was required to produce a technical report documenting the analysis and create a video presentation communicating the findings and recommendations.

## Objectives

Turtle Games wanted to use its customer data to better understand its customers and improve sales performance. The analysis aimed to:

- Investigate the factors associated with customer loyalty points
- Build models that could be used to predict customer loyalty points
- Identify different groups of customers based on their characteristics and behaviour
- Analyse customer reviews to understand customer sentiment
- Use the findings to identify potential opportunities for the marketing team

## Tools Used

- Python — data wrangling, statistical analysis and machine learning
- R — exploratory analysis, statistical testing and multiple linear regression
- pandas and NumPy — manipulating and analysing data
- Matplotlib and Seaborn — data visualisation
- scikit-learn — decision tree regression and K-means clustering
- statsmodels — Ordinary Least Squares regression
- tidyverse and ggplot2 — data preparation, analysis and visualisation in R
- TextBlob — natural language processing and sentiment analysis
- Jupyter Notebook — developing and documenting the Python analysis
- RStudio — developing and documenting the R analysis

## Data Preparation and Exploration

The customer data was loaded into both Python and R and prepared for analysis. This included:

- Removing redundant columns
- Renaming variables to make them easier to understand
- Correcting data types where necessary
- Creating separate DataFrames for different machine learning techniques
- Exploring the distributions of numerical variables
- Creating visualisations to understand the customer data before modelling

Exploratory analysis was also conducted in R using visualisations such as histograms and bar charts.

## Regression Analysis

Linear regression was used in Python to investigate the relationship between loyalty points and customer characteristics.

Individual Ordinary Least Squares regression models were created to compare loyalty points with:

- Age
- Income
- Spending score

Of the individual variables investigated, spending score had the strongest relationship with loyalty points.

Multiple linear regression was then conducted in R using age, income and spending score together. The model produced an adjusted R² of approximately 0.84, indicating that the combination of these variables explained a substantial proportion of the variation in loyalty points.

Model assumptions were investigated using statistical tests and diagnostic visualisations, including Q-Q plots and residual plots. The residual analysis suggested that the relationship between the variables may not have been entirely linear, which was considered when interpreting the model.

## Decision Tree Regression

A decision tree regressor was created in Python to further investigate the factors associated with customer loyalty points.

The data was divided into training and testing datasets and an initial decision tree was created. The original tree was very large, so the model was pruned to make it easier to interpret.

The performance of the pruned model was compared with the original using:

- Mean Absolute Error
- Mean Squared Error
- Root Mean Squared Error

The simpler model produced similar error measurements to the larger model, suggesting that the tree could be simplified without substantially reducing its performance.

The final decision tree identified spending score as the most important initial split, followed by customer income.

## Customer Segmentation

K-means clustering was used to identify different groups of customers based on income and spending score.

The number of clusters was investigated using:

- The elbow method
- The silhouette method
- Scatterplots
- Density plots

Different numbers of clusters were compared before five customer groups were selected. This allowed customers with different combinations of income and spending behaviour to be identified.

One particularly interesting group contained customers with relatively high incomes but comparatively low spending scores, presenting a potential opportunity for targeted marketing.

## Sentiment Analysis

Natural language processing was used to analyse customer reviews and review summaries.

The analysis included:

- Tokenising customer reviews
- Removing stop words
- Identifying the most frequently occurring words
- Calculating sentiment polarity
- Calculating sentiment subjectivity
- Comparing the sentiment of customer reviews and review summaries

TextBlob was used to calculate polarity and subjectivity scores for individual reviews and summaries.

Overall, the review data showed slightly positive customer sentiment, suggesting that customers were generally positive about the products they had received.

## Key Findings

The analysis identified several important patterns within the customer data:

- Spending score showed the strongest individual relationship with loyalty points
- Age, income and spending score together explained a substantial proportion of the variation in loyalty points within the multiple linear regression model
- The decision tree identified spending score and income as important factors when predicting loyalty points
- Customers with a spending score above 67 and an income above approximately £43,870 were associated with higher loyalty points within the decision tree
- Five distinct customer groups were identified using K-means clustering
- One customer group had relatively high income but comparatively low spending scores
- Customer reviews were, on average, slightly positive

## Recommendations

Based on the findings of the analysis:

- Consider targeting customers with relatively high incomes but low spending scores with specific deals and offers
- Use customer segmentation to develop more targeted marketing strategies for different customer groups
- Consider using positive comments from genuine customer reviews within marketing activity
- Target marketing activity towards customers who have the potential to increase their spending and engagement with Turtle Games
- Continue to use customer behaviour and loyalty data to identify opportunities to improve customer retention and sales performance

## Limitations

The project used simulated customer data and the findings should therefore be considered within the context of the project.

The regression diagnostics indicated that some relationships within the data may not have been entirely linear. This means that the regression results should be interpreted with some caution.

The machine learning models identify patterns and relationships within the available data, but these relationships should not necessarily be interpreted as causal.

## Project Files

- [View Turtle Games Analysis Jupyter Notebook](Turtle-Games-Analysis-Python.ipynb)
- [View Turtle Games Analysis R Script](Turtle-Games-Analysis-r.R)
- [View Turtle Games Analysis Technical Report](Turtle-Games-Analysis-Technical-Report.pdf)
- [View Turtle Games Analysis Presentation Slide Deck](Turtle-Games-Analysis-Presentation-Slide-Deck.pdf)
