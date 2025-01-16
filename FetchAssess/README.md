# FetchAssess
GitHub URL:
https://github.com/spainnear/FetchAssess

I did an assessment with this API (https://themealdb.com/api.php) over 5 years ago.
This API is a mess.They did a poor job architected the database as there is no one to many
table for ingredients and measure.
If they did a one to many, then there would be a nested array in the JSON payload for 
measure and ingredients.
It also would have been a trivial matter to filter out empty strings and do the
combining of the measure and ingredients and make the combination a nested array in the feed.
I always advocate doing as much parsing on the server, since the server is much more powerful
than a mobile device.
Nevertheless, I filtered out nil and empty strings for the final output.
This was built with XCode 16 Beta; there is still some instability.
