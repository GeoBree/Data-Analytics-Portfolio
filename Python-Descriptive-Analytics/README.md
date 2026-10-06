# Descriptive Analytics Project using Python

## Project Overview

This project involved analysing NHS appointment data using Python. The aim was to understand how NHS resources were being utilised and whether there was adequate staff and capacity within the system.

The analysis focused on appointment volumes, service settings, healthcare professionals, appointment modes and missed appointments to identify patterns that could help inform decisions around NHS capacity.

## Project Context

This project was completed as part of a data analytics training programme. An assignment notebook template was provided as the starting point for the project, which I then used to conduct and document my own analysis.

## Objectives

The analysis aimed to understand:

- Whether there was adequate staff and capacity within NHS networks
- How NHS resources were being utilised
- How staff utilisation varied over time
- Whether there was a relationship between missed appointments and the length of time between booking and attending an appointment

## Tools Used

- Python — data wrangling, analysis and visualisation
- pandas — manipulating, filtering, grouping and analysing DataFrames
- NumPy — supporting numerical analysis
- Matplotlib — creating data visualisations
- Seaborn — creating statistical visualisations
- Jupyter Notebook — developing and documenting the analysis

## Data Preparation and Exploration

The datasets were loaded into Python and explored using pandas. This allowed me to understand the structure, categories and time periods contained within the data.

The initial analysis included:

- Identifying the number of unique ICB and sub-ICB locations
- Identifying the most frequently occurring sub-ICB locations
- Exploring unique values within variables such as service setting, context type, national category and appointment status
- Identifying the start and end dates of the datasets
- Converting date variables into appropriate datetime formats
- Creating subsets of the data for further analysis
- Filtering DataFrames to investigate particular locations and time periods
- Using groupby to aggregate appointment data

## Data Analysis and Visualisation

I used Python to investigate patterns within NHS appointment activity and resource utilisation. The analysis included:

- Creating time-series visualisations to investigate changes in appointment volumes over time
- Comparing appointment volumes across different service settings
- Analysing different context types and appointment modes
- Investigating the utilisation of healthcare professionals over time
- Using boxplots to compare the distribution of appointment volumes across service settings
- Analysing appointment status to investigate missed appointments
- Comparing missed appointments with the length of time between booking and the appointment
- Breaking down missed appointments by appointment mode
- Using bar charts and lineplots to communicate patterns within the data

## Key Findings

The analysis identified several patterns within NHS appointment activity:

- General Practice accounted for substantially more appointments than the other service settings
- November 2021 had the highest appointment volume within the period analysed
- Appointment utilisation was particularly high during autumn 2021
- Face-to-face appointments were the most common appointment mode
- The majority of appointments were attended, although missed appointments remained an area for further investigation
- Missed appointments were particularly common for appointments booked between 2 and 7 days in advance
- Same-day telephone appointments appeared to have a relatively high number of missed appointments
- Appointment activity reduced significantly at weekends, suggesting that there may be unused capacity outside normal working days

## Recommendations

Based on the findings of the analysis:

- Consider increasing capacity to accommodate future increases in demand
- Explore increasing appointment availability during weekends and bank holidays
- Consider greater use of telephone appointments where appropriate to improve efficiency
- Provide patients with more specific times for telephone appointments rather than broad time windows
- Use reminder messages for appointments booked further in advance to help reduce missed appointments
- Consider both increasing capacity and reducing missed appointments when looking to improve the efficiency of primary care services

## Limitations

The datasets did not contain all of the information required to directly measure NHS capacity. Some conclusions therefore relied on patterns within appointment activity and utilisation rather than direct measures of available capacity.

The analysis identified relationships and patterns within the available data, but these should not necessarily be interpreted as causal relationships.

## Project Files

[View NHS Analysis Jupyter Notebook](NHS-Appointment-Analysis.ipynb)
[View NHS Analysis Technical Report](NHS-Appointment-Technical-Report.pdf)
