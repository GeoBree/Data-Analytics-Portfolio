## LSE Data Analytics Online Career Accelerator 
# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment 5 scenario
## Turtle Games’s sales department has historically preferred to use R when performing 
## sales analyses due to existing workflow systems. As you’re able to perform data analysis 
## in R, you will perform exploratory data analysis and present your findings by utilising 
## basic statistics and plots. You'll explore and prepare the data set to analyse sales per 
## product. The sales department is hoping to use the findings of this exploratory analysis 
## to inform changes and improvements in the team. (Note that you will use basic summary 
## statistics in Module 5 and will continue to go into more detail with descriptive 
## statistics in Module 6.)

################################################################################

## Assignment 5 objective
## Load and wrangle the data. Use summary statistics and groupings if required to sense-check
## and gain insights into the data. Make sure to use different visualisations such as scatterplots, 
## histograms, and boxplots to learn more about the data set. Explore the data and comment on the 
## insights gained from your exploratory data analysis. For example, outliers, missing values, 
## and distribution of data. Also make sure to comment on initial patterns and distributions or 
## behaviour that may be of interest to the business.

################################################################################

# Module 5 assignment: Load, clean and wrangle data using R

## It is strongly advised that you use the cleaned version of the data set that you created and 
##  saved in the Python section of the course. Should you choose to redo the data cleaning in R, 
##  make sure to apply the same transformations as you will have to potentially compare the results.
##  (Note: Manual steps included dropping and renaming the columns as per the instructions in module 1.
##  Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 

## 1. Open your RStudio and start setting up your R environment. 
## 2. Open a new R script and import the turtle_review.csv data file, which you can download from 
##      Assignment: Predicting future outcomes. (Note: You can use the clean version of the data 
##      you saved as csv in module 1, or, can manually drop and rename the columns as per the instructions 
##      in module 1. Drop ‘language’ and ‘platform’ and rename ‘remuneration’ and ‘spending_score’) 
## 3. Import all the required libraries for the analysis and view the data. 
## 4. Load and explore the data.
##    - View the head the data.
##    - Create a summary of the new data frame.
## 5. Perform exploratory data analysis by creating tables and visualisations to better understand 
##      groupings and different perspectives into customer behaviour and specifically how loyalty 
##      points are accumulated. Example questions could include:
##    - Can you comment on distributions, patterns or outliers based on the visual exploration of the data?
##    - Are there any insights based on the basic observations that may require further investigation?
##    - Are there any groupings that may be useful in gaining deeper insights into customer behaviour?
##    - Are there any specific patterns that you want to investigate
## 6. Create
##    - Create scatterplots, histograms, and boxplots to visually explore the loyalty_points data.
##    - Select appropriate visualisations to communicate relevant findings and insights to the business.
## 7. Note your observations and recommendations to the technical and business users.

###############################################################################

# Your code here.
# Your code here.
# Import libraries
library(tidyverse)
library(skimr)
library(DataExplorer)
library(plotly)

# View working directory.
getwd()
# "C:/Users/gebre/OneDrive/Documents/LSE DA Course/Course 3/Assignment/R Assignment activities"
# R preset the working directory because the .r script was saved in the correct place.

# Import CSV file.
turtle <- read.csv('turtle_reviews.csv', header=T)

# Sense check the data.
View(turtle)
head(turtle)
as_tibble(turtle)
dim(turtle) 
# 2000 observations, 11 variables
# R inferred the data types for the columns. Product can be changed.

# Summarise the data.
summary(turtle)
DataExplorer::create_report(turtle)

# Add renamed columns.
turtle$income <- turtle$remuneration..k..
turtle$spending_score <- turtle$spending_score..1.100.

# Drop unneeded and copied columns by creating a new data frame.
turtle1 <- subset(turtle, select = -c(language,
                                      platform,
                                      remuneration..k..,
                                      spending_score..1.100.))

# View the newly created data frame.
View(turtle1)
head(turtle1)

# Check for missing values.
sum(is.na(turtle1))
# There are no missing values.

# Change product to factor (categoric)
turtle1$product <- as.factor(turtle1$product)

# Check the data frame
as_tibble(turtle1)
str(turtle1)
# Product has successfully changed to factor.

# Count the products.
turtle1 %>% count(product)
# Pretty much all of the products appear 10 times in the data.

# Create visualisations for EDA.
# Boxplot for age
ggplot(turtle1, aes(y=age)) +
  geom_boxplot(fill = 'green') +
  scale_y_continuous(breaks = seq(0, 120, by = 2)) +
  labs(title="Boxplot for Age",
       ylabel="Age") +
  theme_minimal() +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())
# Min age 17. Max age 72. Median age 38.

# Histogram for age.
ggplot(turtle1, aes(x=age)) +
  geom_histogram(fill = 'green', color = 'black', binwidth = 5) +
  labs(title = "Histogram showing distribution of age",
       y = "Count",
       x = "Age") +
  scale_y_continuous(breaks = seq(0, 400, by = 50)) +
  scale_x_continuous(breaks = seq(0,100, by = 5)) +
  theme_minimal()
# More younger customers than older customers, but there is a spike at the extreme.

# Histogram for loyalty points.
ggplot(turtle1, aes(x=loyalty_points)) +
  geom_histogram(binwidth = 250,
                 fill = 'green', 
                 color = 'black') +
  labs(title = "Histogram showing distribution of loyalty points",
       y= "Count of loyalty points",
       x = "Loyalty Points") +
  scale_y_continuous(breaks = seq(0, 400, by = 50)) +
  scale_x_continuous(breaks = seq(0,10000, by = 500)) +
  theme_minimal()
# Left skew. Shows some outliers reaching all the way to more than 6500.

# Boxplot for loyalty points.
ggplot(turtle1, aes(y=loyalty_points)) +
  geom_boxplot(fill = 'green',
               color = 'black') +
  scale_y_continuous(breaks = seq(0, 10000, by = 350))+
  labs(title = "Boxplot showing distribution of loyalty points",
       y = "Loyalty Points") +
  theme_minimal() +
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank()) 
# Lots of outliers above 3250.

# density and boxplot for loyalty points.
ggplot(turtle1, aes(y=loyalty_points, x=" ")) +
  geom_violin(color='black', fill='red') +
  geom_boxplot(color = 'blue', fill = 'green', width=0.25) +
  labs(title = "Distribution of loyalty points using a boxplot and a violin plot",
       y = "Loyalty Points") +
  theme_minimal() +
  theme(axis.title.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

# Bar plot for count of education
ggplot(turtle1, aes(x=education)) +
  geom_bar(fill = 'green',
           color = 'black', 
           stat = 'count') +
  geom_text(stat = 'count',
            aes(label = after_stat(count)),
            vjust = -0.3,
            size = 5) +
  scale_y_continuous(breaks = seq(0, 1000, by = 50)) +
  labs(title='Bar chart showing count of education groups',
       x='Education Group',
       y='Number of customers') +
  scale_x_discrete(labels = c("Basic",
                              "Diploma",
                              "Graduate",
                              "PhD",
                              "Postgraduate")) +
  theme_minimal()
# There are many more graduates compared to other groups.

# density and boxlplot for loyalty points compared to education
ggplot(turtle1, aes(y=loyalty_points, x=education)) +
  geom_violin(color='black', fill = 'red') +
  geom_boxplot(color = 'blue', fill = 'green', width = 0.25) +
  scale_y_continuous(breaks = seq(0,7000, by =500)) +
  scale_x_discrete(labels = c("Basic",
                              "Diploma",
                              "Graduate",
                              "PhD",
                              "Postgraduate")) +
  labs(title="Violin and box plots showing the distribution of loyalty points compared to education level",
       y = "Loyalty Points",
       x = "Education") +
  theme_minimal()
# All of the education levels have similar distributions, 
# except for basic.

# Scatterplot for age and loyalty points
ggplot(turtle1, aes(x=age, y=loyalty_points)) +
  geom_point(color = 'dark green') +
  labs(title="Scatterplot showing distribution of age compared to loyalty points",
       y="Loyalty Points",
       x="Age") +
  scale_y_continuous(breaks = seq(0, 8000, by = 500)) +
  scale_x_continuous(breaks = seq(0, 80, by = 5)) +
  theme_minimal()
# Most customers have loyalty points below 2500 regardless of age,
# but there are some very large accumulations.

# Scatterplot for age and income
ggplot(turtle1, aes(x=age, y=income, color = education)) +
  geom_point(color = 'dark green') +
  labs(title="Scatterplot showing the distribution of age and income",
       y= "Income (£1000)",
       x="Age") +
  scale_y_continuous(breaks = seq(0, 120, by = 10)) +
  scale_x_continuous(breaks =seq(0,80, by = 5)) +
  theme_minimal()
# The far left dots are 17 year olds. There is a 17 year old earning £80000.

# Scatterplot for age and spending score.
ggplot(turtle1, aes(x=age, y=spending_score)) +
  geom_point(color = 'dark green') +
  labs(title="Scatterplot showing the distribution of age and spending score",
       y="Spending Score",
       x="Age") +
  scale_y_continuous(breaks = seq(0, 110, by = 10)) +
  scale_x_continuous(breaks = seq(0, 80, by = 5)) +
  theme_minimal()
# The distribution is very varied, there is no real pattern.

# Scatterplot for loyalty points and spending score
ggplot(turtle1, aes(y=loyalty_points, x=spending_score)) +
  geom_point(color = 'dark green') +
  labs(title="Scatterplot showing the distribution of spending score and loyalty points",
       y="Loyalty Points",
       x="Spending Score") +
  scale_y_continuous(breaks = seq(0, 8000, by = 250)) +
  scale_x_continuous(breaks = seq(0, 100, by = 10)) +
  theme_minimal()
# After 60 on the spending score, the loyalty points change,
# before 60 they follow a similar linear pattern.

# Scatterplot for loyalty points and income.
ggplot(turtle1, aes(x=income, y=loyalty_points)) +
  geom_point(color = 'dark green') +
  labs(title="Scatterplot showing the distribution of income and loyalty points",
       y="Loyalty Points",
       x="Income") +
  scale_y_continuous(breaks = seq(0, 8000, by = 250)) +
  scale_x_continuous(breaks = seq(0, 120, by = 10)) +
  theme_minimal()
# Similar distribution to the loyalty points and spending score.
# After about £85000 the loyalty points diverge, 
# before £85000 the pattern is linear.

# Scatterplot for spending score and income.
ggplot(turtle1, aes(x=spending_score, y=income)) +
  geom_point(color = 'dark green') +
  labs(title="Scatterplot showing the distribution of spending score and income",
       x="Spending Score",
       y="Income") +
  scale_y_continuous(breaks = seq(0, 120, by = 20)) + 
  scale_x_continuous(breaks = seq(0, 100, by = 10)) +
  theme_minimal()
# This shows the clusters that we discovered on Python.

ggplot(turtle1, aes(x=product, y=loyalty_points)) +
  geom_bar(stat= "summary", fun = "mean")
# This is way to busy to get any real value from it. 

ggplot(turtle1, aes(x=product, y=income)) +
  geom_bar(stat= "summary", fun = "mean")
# Not useful.

# Bar plot for count of education
ggplot(turtle1, aes(x=gender)) +
  geom_bar(fill = 'green',
           color = 'black', 
           stat = 'count') +
  geom_text(stat = 'count',
            aes(label = after_stat(count)),
            vjust = -0.3,
            size = 5) +
  scale_y_continuous(breaks = seq(0, 1200, by = 50)) +
  labs(title='Bar chart showing count of genders',
       x='Gender',
       y='Number of customers') +
  theme_minimal()
# There are many more graduates compared to other groups

# Scatterplot for spending score and income.
ggplot(turtle1, aes(x=income, y=spending_score)) +
  geom_point(color = 'dark green') +
  labs(title="Scatterplot showing the distribution of spending score and income",
       x="Income",
       y="Spending Score") +
  scale_y_continuous(breaks = seq(0, 100, by = 10)) + 
  scale_x_continuous(breaks = seq(0, 120, by = 20)) +
  theme_minimal()
# This shows the clusters that we discovered on Python.








###############################################################################
###############################################################################

# Assignment 6 scenario

## In Module 5, you were requested to redo components of the analysis using Turtle Games’s preferred 
## language, R, in order to make it easier for them to implement your analysis internally. As a final 
## task the team asked you to perform a statistical analysis and create a multiple linear regression 
## model using R to predict loyalty points using the available features in a multiple linear model. 
## They did not prescribe which features to use and you can therefore use insights from previous modules 
## as well as your statistical analysis to make recommendations regarding suitability of this model type,
## the specifics of the model you created and alternative solutions. As a final task they also requested 
## your observations and recommendations regarding the current loyalty programme and how this could be 
## improved. 

################################################################################

## Assignment 6 objective
## You need to investigate customer behaviour and the effectiveness of the current loyalty program based 
## on the work completed in modules 1-5 as well as the statistical analysis and modelling efforts of module 6.
##  - Can we predict loyalty points given the existing features using a relatively simple MLR model?
##  - Do you have confidence in the model results (Goodness of fit evaluation)
##  - Where should the business focus their marketing efforts?
##  - How could the loyalty program be improved?
##  - How could the analysis be improved?

################################################################################

## Assignment 6 assignment: Making recommendations to the business.

## 1. Continue with your R script in RStudio from Assignment Activity 5: Cleaning, manipulating, and 
##     visualising the data.
## 2. Load and explore the data, and continue to use the data frame you prepared in Module 5.
## 3. Perform a statistical analysis and comment on the descriptive statistics in the context of the 
##     review of how customers accumulate loyalty points.
##  - Comment on distributions and patterns observed in the data.
##  - Determine and justify the features to be used in a multiple linear regression model and potential
##.    concerns and corrective actions.
## 4. Create a Multiple linear regression model using your selected (numeric) features.
##  - Evaluate the goodness of fit and interpret the model summary statistics.
##  - Create a visual demonstration of the model
##  - Comment on the usefulness of the model, potential improvements and alternate suggestions that could 
##     be considered.
##  - Demonstrate how the model could be used to predict given specific scenarios. (You can create your own 
##     scenarios).
## 5. Perform exploratory data analysis by using statistical analysis methods and comment on the descriptive 
##     statistics in the context of the review of how customers accumulate loyalty points.
## 6. Document your observations, interpretations, and suggestions based on each of the models created in 
##     your notebook. (This will serve as input to your summary and final submission at the end of the course.)

################################################################################
# Your code here.
# Import libraries.
library(moments)

# Check normality of numeric variables.

## Check normality of loyalty points
# Create a qqplot to check normality along with a reference line.
qqnorm(turtle1$loyalty_points)
qqline(turtle1$loyalty_points,
       col = 'red',
       lwd = 2)

# Complete a Shapiro-Wilk test.
shapiro.test(turtle1$loyalty_points)
# p-value is 2.2e-16 which is much smaller than 0.05,
# therefore the loyalty points is not normally distributed.

# Check kurtosis and skewness.
skewness(turtle1$loyalty_points)
# Skewness is 1.46 which shows it is not symmetric.
kurtosis(turtle1$loyalty_points)
# Kurtosis is 4.7 which is greater than 3 which means there are heavy tails.
# Loyalty points is not normally distributed.

## Check normality for age.
# Create a qqplot to chek normality along with a reference line.
qqnorm(turtle1$age)
qqline(turtle1$age,
       col = 'red',
       lwd = 2)

# Complete a Shapiro-Wilk test
shapiro.test(turtle1$age)
# p-value is 2.2e-16 which is much less than 0.05
# therefore it is not normally distributed.

# Check skewness and kurtosis.
skewness(turtle1$age)
# Skewness is 0.61 which is acceptable skewness with a right-sided skew.
kurtosis(turtle$age)
# Kurtosis is near 3 (2.8) which is okay. 
# This means that the distribution is close to normal in terms of kurtosis.


## Check normality of spending score
# Create a qqplot to check normality along with a reference line.
qqnorm(turtle1$spending_score)
qqline(turtle1$spending_score,
       col = 'red',
       lwd=2)
# A lot of the points lie on the reference line, so could suggest normality.

# Check normality with a Shapiro-Wilk test.
shapiro.test(turtle1$spending_score)
# p-value is 2.2e-16 which is much less than 0.05, 
# therefore the spending score is not normally distributed.

# Check skewness and kurtosis.
skewness(turtle1$spending_score)
# Skewness is very close to 0, which suggests that it is symmetrical
kurtosis(turtle1$spending_score)
# Kurtosis is near 3, which suggests that it could be close to normal 
# in terms of kurtosis.


## Check normality of income.
qqnorm(turtle1$income)
qqline(turtle1$income,
       col = 'red',
       lwd = 2)
# The points follow the line which could suggest normality.

# Check normality with Shapiro-Wilk test.
shapiro.test(turtle1$income)
# p-value is 2.2e-16 which shows that the data is not normally distributed.

# Check skewness and kurtosis.
skewness(turtle1$income)
# A skewness of 0.41 which is in the suitable symmetrical range.
# There is a slight right skewness.
kurtosis(turtle1$income)
# Kurtosis of 2.59 which is less than 3, therefore income can be considered
# practically normal.

# Age, spending score and income are not statistically normally distributed,
# but due to to their skewness and kurtosis, they can be considered practically 
# normally distributed for multiple linear regression. 


## Complete multiple linear regressions on age, income and spending score for loyalty points.
# Create a data frame for just numeric variables,
# so transformations can be added if needs be.
turtle_num <- subset(turtle1, select = c(loyalty_points,
                                         age,
                                         income,
                                         spending_score))

# Create a multiple linear regression for age and income.
model1 <- lm(loyalty_points ~ age + income,
             turtle_num)
# Check summary of model1
summary(model1)
# There is an adjusted R2 value of 0.3804 which suggests that there is a 
# weak relationship between the two X variables and the y variable.

# Create a multiple linear regression for age and spending score
model2 <- lm(loyalty_points ~ age + spending_score,
             turtle_num)
# Check the summary of model2
summary(model2)
# The adjusted R2 value is better than model1.
# The 46% (R2 = 0.4638) of the relationship can be described by
# by the two variables.


# Create a multiple linear regression for income and spending score
model3 <- lm(loyalty_points ~ income + spending_score,
             turtle_num)
# Check the summary of model3
summary(model3)
# The adjusted R2 is much more significant (0.8267). 
# This says the 83% of the relationship can be described by the two variables.


# Create a multiple linear regression for all the X variables.
model4 <- lm(loyalty_points ~ age + income + spending_score,
             turtle_num)
# Check the summary of model4.
summary(model4)
# The adjusted R2 value has increased again. 
# The  %84 loyalty points are determined by the X variables.
# The p values are show that the all the variables are significant predictors.

# Complete a visualisation of the model4.
plot(model4)
# The visualisations show that they follow the predictor model well.


# Create predicted customers.
# View limits of each variable.
summary(turtle$age)
# Min - 17, max - 72. Pick customers within that range.
summary(turtle$income)
# Min - 12.30, max - 112.34. Pick customers within that range.
summary(turtle$spending_score)
# Min - 1, max - 99

# Create a prediction data frame
new_customer <- data.frame(
  age = c(20, 35, 50, 65),
  income = c(15,45,75,105),
  spending_score = c(25, 36, 49, 64))

# View new_customer data frame.
new_customer
# Make predictions.
predict(model4, newdata = new_customer)
# The predictions have created a negative loyalty points for the very lowest prediction,
# This is obviously not possible, which means that it needs tweaking.

# Add predictions to the new_customer data frame.
new_customer$predicitons <- predict(model4, newdata = new_customer)


# View the prediction data frame
View(new_customer)

new_customer2 <- data.frame(
  age = c(28, 33, 68, 52, 41),
  income = c(51, 41, 100, 71, 30),
  spending_score = c(50, 39, 63, 10, 88))

# Make predictions on new_customer2 data frame.
predict(model4, newdata = new_customer2)

# Add the predictions to the data frame.
new_customer2$loyalty_points_prediction <- predict(model4,
                                                      newdata = new_customer2)

# View the new predicted data frame.
View(new_customer2)

# Create new_customer data frame based on knowledge from decision tree.
new_customer3 <- data.frame(
  age = c(45, 50, 55, 60),
  spending_score = c(50, 65, 70, 85),
  income = c(40, 49, 43, 70))

# Make predictions on new_customer3.
predict(model4, newdata = new_customer3)

# Add the predictions to the data frame.
new_customer3$predicted_loyalty_points <- predict(model4, newdata = new_customer3)

# View the data frame with the predicted values.
View(new_customer3)

##############################################################################
###############################################################################




