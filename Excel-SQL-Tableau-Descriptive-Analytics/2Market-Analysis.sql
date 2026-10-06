-- Create marketing_data.csv table
CREATE TABLE marketing_data (
	ID BIGSERIAL PRIMARY KEY,
	Year_Birth INTEGER,
	Education TEXT,
	Marital_Status TEXT,
	INCOME TEXT,
	Kidhome INTEGER,
	Teenhome INTEGER,
	Dt_Customer TEXT,
	Recency INTEGER,
	AmtLiq INTEGER,
	AmtVeg INTEGER,
	AmtNonVeg INTEGER,
	AmtPes INTEGER,
	AmtChocolates INTEGER,
	AmtComm INTEGER,
	NumDeals INTEGER,
	NumWebBuy INTEGER,
	NumWalkinBuy INTEGER,
	NumVisits INTEGER,
	Response INTEGER,
	Complain INTEGER,
	Country VARCHAR (4),
	Count_success INTEGER);

-- Create ad_data.csv table
CREATE TABLE ad_data (
	ID BIGSERIAL PRIMARY KEY,
	Bulkmail_ad TEXT,
	Twitter_ad TEXT,
	Instagram_ad TEXT,
	Facebook_ad TEXT,
	Brochure_ad TEXT);

-- Check both new tables

SELECT *
FROM public.marketing_data;

SELECT * 
FROM public.ad_data;

-- Import of CSV files Successful

-- Inner Join of the two tables using ID as common field
	FROM public.marketing_data md
JOIN public.ad_data ad 
ON md.ID = ad.ID;
	
-- Which social media platform is the most effective method of advertising in each country?
SELECT 
	md.Country,
	ad.Twitter_ad AS Twitter,
	ad.Facebook_ad AS Facebook,
	ad.Instagram_ad AS Instagram
FROM public.marketing_data md
JOIN public.ad_data ad
ON md.ID = ad.ID;

SELECT
	md.country,
	SUM(ad.Twitter_ad) AS "Twitter Total",
	SUM(ad.Facebook_ad) AS "Facebook Total",
	SUM(ad.Instagram_ad) AS "Instagram Total"
FROM public.marketing_data md
JOIN public.ad_data ad
ON md.ID = ad.ID
GROUP BY Country;

-- Total unable to be achieved because of wrong data type

-- Dropping ad_data.csv table to improve data types
DROP TABLE ad_data;

-- Creating ad_data.csv table again
CREATE TABLE ad_data (
	ID BIGSERIAL PRIMARY KEY,
	Bulkmail_ad INTEGER,
	Twitter_ad INTEGER,
	Instagram_ad INTEGER,
	Facebook_ad INTEGER,
	Brochure_ad INTEGER);

-- ad_data.csv table now good with correct data types

-- Trying query again - Which social media platform is the most effective method of advertising in each country?

SELECT
	md.Country,
	SUM(ad.Twitter_ad) AS "Twitter Total",
	SUM(ad.Facebook_ad) AS "Facebook Total",
	SUM(ad.Instagram_ad) AS "Instagram Total"
FROM public.marketing_data md
JOIN ad_data ad
ON md.ID = ad.ID
GROUP BY Country;

-- Which social media platform is the most effective method of advertising based on marital status?

SELECT
	md.Marital_status,
	SUM(ad.Twitter_ad) AS "Twitter Total",
	SUM(ad.Facebook_ad) AS "Facebook Total",
	SUM(ad.Instagram_ad) AS "Instagram Total"
FROM public.marketing_data md
JOIN ad_data ad
ON md.ID = ad.ID
GROUP BY Marital_status;

-- Which social media platform(s) seem(s) to be the most effective per country?

SELECT 
	md.Country,
	SUM(md.AmtLiq) AS "Total Alchol Sales",
	SUM(md.Amtveg) AS "Total Veg Sales",
	SUM(md.Amtnonveg) AS "Total Meat Sales",
	SUM(md.Amtpes) AS "Total Fish Sales",
	SUM(md.Amtchocolates) AS "Total Chocolate Sales",
	SUM(md.Amtcomm) AS "Total Commodities Sales",
	SUM(ad.Twitter_ad) AS "Twitter Total",
	SUM(ad.Facebook_ad) AS "Facebook Total",
	SUM(ad.Instagram_ad) AS "Instagram Total",
	SUM(ad.Twitter_ad) + SUM(ad.Facebook_ad) + SUM(ad.Instagram_ad) AS "Ads Total"
FROM public.Marketing_data md
JOIN ad_data ad
ON md.ID = ad.ID 
GROUP BY Country;
	
