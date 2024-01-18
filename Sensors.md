#  A list of all the sensors, including the console itself
# https://weatherlink.github.io/v2-api/interactive-sensor-catalog

# Console Health: sensor type 509

|**Field Name**|**Data Type**|**Units**|**Description**|
| :- | :- | :- | :- |
|app\_uptime|long|seconds|Uptime since last app restart|
|battery\_condition|integer||<p>Battery health condition:</p><p>1: Unknown</p><p>2: Good</p><p>3: Overheat</p><p>4: Dead</p><p>5: Overvoltage</p><p>6: Unspecified Failure</p><p>7: Cold</p>|
|battery\_current|float|milliamps|Positive means the battery is charging while negative means the battery is discharging|
|battery\_cycle\_count|long||Number of times the battery has used the equivalent of a full battery charge since the last counter reset|
|battery\_percent|integer|percentage|Battery charge|
|battery\_status|integer||<p>Battery charge status:</p><p>1: Unknown</p><p>2: Charging</p><p>3: Discharging</p><p>4: Not charging</p><p>5: Full</p>|
|battery\_temp|float|degrees Celsius|Battery temperature|
|battery\_voltage|integer|millivolts|Battery voltage|
|bgn|integer||Background Noise level of DavisTalk radio receiver|
|bootloader\_version|long||Bootloader version|
|charger\_plugged|integer||<p>Power charger plugged in status:</p><p>0: Unplugged</p><p>1: Plugged in</p>|
|clock\_source|integer||0: Unset, 1: User, 2: Network, 3: GNSS|
|connection\_uptime|long|seconds|Uptime since last upload connection loss|
|console\_api\_level|long||API level version number|
|console\_os\_version|string||Console operating system version number|
|console\_radio\_version|string||Radio firmware version number|
|console\_sw\_version|string||Console application version number|
|database\_kilobytes|long|kilobytes|Onboard database size in KB|
|dns\_type\_used|integer||DNS used (1=Primary, 2=Secondary, 3=public) if available|
|free\_mem|long|kilobytes|Available internal RAM in KB|
|gnss\_sip\_tx\_id|integer|||
|health\_version|integer||Health data structure version number|
|internal\_free\_space|long|kilobytes|Available space in the storage partition in KB|
|ip\_address\_type|integer||<p>IP address type:</p><p>1: Dynamic</p><p>2: Dyn DNS Override</p><p>3: Static</p>|
|ip\_v4\_address|string||IP Address of the Console|
|ip\_v4\_gateway|string||IP Address of the LAN?~@~Ys Router or Gateway|
|ip\_v4\_netmask|string||IP Address of the Subnet Mask|
|link\_uptime|long|seconds|Uptime since last WiFi network loss|
|local\_api\_queries|long||Local API queries served|
|os\_uptime|long|seconds|Uptime since last reboot|
|queue\_kilobytes|long|kilobytes|Backend upload record queue size in KB|
|rx\_kilobytes|long|1000 bytes|Total Bytes received on network interface|
|system\_free\_space|long|kilobytes|Available space in the system partition in KB|
|tx\_kilobytes|long|1000 bytes|Total Bytes sent on network interface|
|wifi\_rssi|integer|decibel-milliwatts|WiFi Signal Strength|

# Barometer: sensor type 242
|**Field Name**|**Data Type**|**Units**|
| :- | :- | :- |
|bar_absolute |   float  |  inches of mercury|    
|bar_offset |   float  |  inches of mercury|
|bar_sea_level |   float |   inches of mercury|    
|bar_trend |   float |   inches of mercury|    
|ts |   integer | Unix timestamp of the data record|

# Inside Temp and Hum: Sensor Type 365
|**Field Name**|**Data Type**|**Units**|**Description**|
| :- | :- | :- | :- |
|dew_point_in |   float |   degrees Fahrenheit  |  Most recent inside dew point reading|
|heat_index_in  |  float |   degrees Fahrenheit  |  Most recent inside heat index reading|
|hum_in   | float   | percent relative humidity |   Most recent inside humidity reading|
|temp_in |   float |   degrees Fahrenheit |   Most recent inside temperature reading|
|ts |   integer | |Unix timestamp of the data record|
|wbgt_in  |  float  |  degrees Fahrenheit |   Most recent inside wet bulb globe temperature reading|
|wet_bulb_in  |  float  |  degrees Fahrenheit |   Most recent inside wet buld reading|

# Vantage Pro2 Wireless: Sensor Type 43


|**Field Name**|**Data Type**|**Units**|
| :- | :- | :- |
| bar | float | inches of mercury |
| dew_point | float | degrees Fahrenheit |
| et_day | float | inches |
| et_month | float | inches |
| et_year | float | inches |
| forecast_desc | string | forecast messages if available |
| forecast_rule | integer |  |
| heat_index | float | degrees Fahrenheit |
| hum_extra_1 | integer | percent relative humidity |
| hum_extra_2 | integer | percent relative humidity |
| hum_extra_3 | integer | percent relative humidity |
| hum_extra_4 | integer | percent relative humidity |
| hum_extra_5 | integer | percent relative humidity |
| hum_extra_6 | integer | percent relative humidity |
| hum_extra_7 | integer | percent relative humidity |
| hum_in | integer | percent relative humidity |
| hum_out | integer | percent relative humidity |
| moist_soil_1 | integer | centibars |
| moist_soil_2 | integer | centibars |
| moist_soil_3 | integer | centibars |
| moist_soil_4 | integer | centibars |
| rain_day_clicks | integer | clicks for the day |
| rain_day_in | float | inches for the day |
| rain_day_mm | float | millimeters for the day |
| rain_month_clicks | integer | clicks for the month |
| rain_month_in | float | inches for the month |
| rain_month_mm | float | millimeters for the month |
| rain_rate_clicks | integer | clicks per hour |
| rain_rate_in | float | inches per hour |
| rain_rate_mm | float | mm per hour |
| rain_storm_clicks | integer | clicks |
| rain_storm_in | float | inches |
| rain_storm_mm | float | millimeters |
| rain_storm_start_date | integer | seconds |
| rain_year_clicks | integer | clicks for the year |
| rain_year_in | float | inches for the year |
| rain_year_mm | float | millimeters for the year |
| solar_rad | integer | watts per square meter |
| temp_extra_1 | integer | degrees Fahrenheit |
| temp_extra_2 | integer | degrees Fahrenheit |
| temp_extra_3 | integer | degrees Fahrenheit |
| temp_extra_4 | integer | degrees Fahrenheit |
| temp_extra_5 | integer | degrees Fahrenheit |
| temp_extra_6 | integer | degrees Fahrenheit |
| temp_extra_7 | integer | degrees Fahrenheit |
| temp_in | float | degrees Fahrenheit |
| temp_leaf_1 | integer | degrees Fahrenheit |
| temp_leaf_2 | integer | degrees Fahrenheit |
| temp_leaf_3 | integer | degrees Fahrenheit |
| temp_leaf_4 | integer | degrees Fahrenheit |
| temp_out | float | degrees Fahrenheit |
| temp_soil_1 | integer | degrees Fahrenheit |
| temp_soil_2 | integer | degrees Fahrenheit |
| temp_soil_3 | integer | degrees Fahrenheit |
| temp_soil_4 | integer | degrees Fahrenheit |
| uv | integer | ultraviolet index |
| wet_leaf_1 | integer | wetness scale from 0 to 15 |
| wet_leaf_2 | integer | wetness scale from 0 to 15 |
| wet_leaf_3 | integer | wetness scale from 0 to 15 |
| wet_leaf_4 | integer | wetness scale from 0 to 15 |
| wind_chill | float | degrees Fahrenheit |
| wind_dir | integer | degrees of compass |
| wind_gust_10_min | integer | miles per hour |
| wind_speed | integer | miles per hour |
| wind_speed_10_min_avg | integer | miles per hour |
|ts |   integer | Unix timestamp of the data record|
|tx_id | integer | the transmitter ID that the outdoor integrated sensor suite is broadcasting on|
|tz_offset | long | offset in seconds from UTC based on the selected timezone for the station|
