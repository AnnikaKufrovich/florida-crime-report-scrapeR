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

###Crime Files
The first file to look at is the "web scraper" r-script. This file maybe shouldn't be run in its current state, can't tell yet, and requires the function created in "retry_function" to fully run. It would probably be helpful to rename the variable levels in "type" for both the data frames produced (crime_data and cool_data) so that they're sensical. It's hard to tell if "type" is a broader category that "description" is more specific on or if they're entirely seperate variables*. Will need to check out the website this was all drawn from to figure out what to do. This webscraper file is mostly comprised of code for a function "getcrimedata" but the "lexis_web_scraper" file includes another "getcrimedata" function which is coded differently. It's possible that this file is developing towards a cleaner version of the function in "web scraper." It also seems that the "lexis_web_scraper" file categorizes nonviolent crime types but then removes them? Will have to revisit that.

Violent Crime locations were meant to be compared to voter locations.

The "web_scraper" files are an attempt to automate the collection of violent crime data through a website. However the website is not entirely up to date, does not includeall police departments, and police jurisdictions overlap. Possibly not the best thing to continue pursuing but still possible.

###Florida Voter Files
The data we have from Florida includes sex, race political party, address, and voting history for about 13 million voters.

The "database conx mac" file runs SQL statements to retrieve gps locations for each voter's address. The Tiger Database from the US Census needs to be installed to run this code. It currently only checks for un-geocoded addresses. It should be improved to see if a voters address has changed between our theoretical monthly data CDs. We could probably compare Voter IDs between our new and old Dataset and only add the geocodes to our new dataset if addresses match. If our new dataset shows the address to be different, we could just not copy over the geocoding and the "database conx mac" will give that voter a new geocode. Have some SQL work to do with this idea. 

Dario said that Voter ID is also used to append demographic data with voting histories. Voting histories are stored in another folder and the data structure needs to be parsed. Possible questions: What's the folder name for Voting data? Where in the code is voter ID used to append demographic data with voting histories?

The "precinct_mapping" file apparently goes about getting precinct boundaries in a computationally taxing way even though precinct is a column in the voter files. Depending on the structure of the precinct data from the florida voter file, this may still be useful for visualization. 

##Post-Precinct Project Ideas

Per Dario's suggestion, it may be useful to explore datasets in the FGDL GIS archive to compare distances of voters to certain features like major roads and farmland (rurality indicators?)
