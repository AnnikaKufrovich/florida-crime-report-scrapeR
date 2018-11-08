# Crime and Voter Turnout in Florida

Web scraping and geocoding methods for public voter and crime data in R.
The purpose of this project is to provide an accessible base from which to start for any future students of the Political Behavior Lab wishing to perform analysis related to the Florida Dept. of Elections registered voter dataset.

## Getting Started

This project requires the set-up of a PostgreSQL database with PostGIS installed. 

[A quick tutorial setting this up is located here](https://docs.google.com/document/d/1hhwa-ivnAsKP2QJlwx_KGMGpTV4GsyMVnBgJx8dnbbk/edit?usp=sharing)

## Running the Geocoder

The geocoder is set to run on data obtained through CDs throught the Florida Department of Elections. 

Edit the 'database_conx.R' file for your system to point to the folder containing the voter data, and modify the database connection user and password if it is different from what is listed there.

Script should output a modified file for each county file in the dataset.

## Running the Crime Report Web Scraper

These scripts will collect data from online databases for zipcodes specified in files in the respective 'zipcodes' folders. 

They run off of Selenium, a browser testing suite that should be downloaded when you install the 'RSelenium' package.

Relevant dates for the crime mapping can be set at the top of the 'web scraper.R' and 'lexis web scraper.R' files.
These scripts collect a lot of duplicates, but these will be cleaned if the scripts are run all the way through.

## Notes on How Files Interact and Possible Improvements

The first file to look at is the "web scraper" r-script. This file maybe shouldn't be run in its current state, can't tell yet, and requires the function created in "retry_function" to fully run. It would probably be helpful to rename the variable levels in "type" for both the data frames produced (crime_data and cool_data) so that they're sensical. It's hard to tell if "type" is a broader category that "description" is more specific on or if they're entirely seperate variables*. Will need to check out the website this was all drawn from to figure out what to do. This webscraper file is mostly comprised of code for a function "getcrimedata" but the "lexis_web_scraper" file includes another "getcrimedata" function which is coded differently. It's possible that this file is developing towards a cleaner version of the function in "web scraper." It also seems that the "lexis_web_scraper" file categorizes nonviolent crime types but then removes them? Will have to revisit that.

The two database files take the voter data we have and geocode them. It looks like the "database conx mac" file only geocodes points that have yet to be geocoded, likely for when we add data to our dataset. The "precinct_mapping" file apparently makes some kind of ggplot of precincts, more to come on these files later