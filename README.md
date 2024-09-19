# DavisISSMenuBar
 A swiftUI MenuBar app to show Temp, Rain and Average wind speed (over last 2 minutes) from an owned Davis Vantage Pro 2 Wireless using Weatherlink v2 API

# BIG FAT WARNING:
**this thing is only an exercise in learning swift/swiftUI so use it at your own risk!!**

# Build requirements
<p align="left">
    <img src="https://img.shields.io/badge/Xcode-16-brightgreen.svg" />
</p>

# OS requirements
<p align="left">
    <img src="https://img.shields.io/badge/macOS-15-brightgreen.svg" />
</p>

# Conditions:
* International System of Units only! No other abominable system of measurement.
* You own the station under your WeatherLink account.
* The station must be a Davis Vantage Pro 2  Wireless
* You need to know your own stationUUID, stationApiKey and stationApiSecret
* Rate limits: https://weatherlink.github.io/v2-api/rate-limits

details here:

* Davis API: https://weatherlink.github.io/v2-api/
* https://discord.com/channels/882722161641554021/894741305526222849/1113558053380431954





# Discord text excerpt



First, after some deliberation we've made the decision that the WeatherLink v2 API will remain a read only API. Therefore, there is no longer a need for the extra security the API Signature and "t" timestamp parameters provided. We will continue to support these parameters so your existing code does not break. If you choose to drop the use of the api-signature and "t" parameters you will need to add a new HTTP header to every API request. The new header must be named X-Api-Secret (case insensitive) and the value you send in the header will be your API secret. Do not send your API secret as a parameter, it must be sent as a header with the required name.

Our second announcement is regarding the Station ID parameter in the URL when you make a call to get current conditions, historic data, etc. You now have the option to use the weather station's UUID from the WeatherLink.com web site instead of the traditional Station ID number. To find the UUID just go to WeatherLink.com and view the station in question, the URL in your browser will show a UUID that is assigned to the station. Simply use this UUID instead of the traditional integer Station ID that you had to lookup using the /stations API call. The UUID is case insensitive. Additionally, the /stations/{station-ids} API call that allows you to pass a comma delimited list of Station IDs as part of the URL path also accepts the UUIDs and even allows you to mix and match the UUID values with the traditional integer Station ID values. Lastly, any API call that returned a Station ID field named "station_id" in the JSON response will continue to use that field for the traditional integer ID. A new field named "station_id_uuid" has been added to include the UUID value as well in the response.

Both changes are live now in the WeatherLink v2 API. If you have any questions or issues just post a message in the v2 API chat channel


# Kudos

* https://app.quicktype.io for (almost) avoiding me the hassle of manually parse JSON into swift struct
* https://jsonlint.com
* https://markdownlivepreview.com
* Wind+Rain icon https://thenounproject.com/martin25044/
* https://www.figma.com/community/plugin/1265484574589944515/sf-symbols-optimizer 
