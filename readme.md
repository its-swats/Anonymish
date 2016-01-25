# Anonymish
=====
###What is Anonymish?
Anonymish is a location-based chat application allowing users to post messages that can be seen by other users within 20 miles. 

I started working on this app in order to learn React, and how it interacted with rails-api. 

Geolocation is done via Geokit. User provided zip codes are converted to latitude and longitude, and then saved alongside each comment. When a user loads the page, their zip code is converted in to lat/lng, and is then compared against the database, returning only messages that were posted within their area. 


###Technologies Used
* React
* rails-api
* Geokit
* Pure Responsive Grid
* UnderscoreJS, jQuery
