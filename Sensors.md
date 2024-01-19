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

| cdd_day | float | cooling degree days in degrees Fahrenheit, to convert to an equivalent Celsius value use C = F x 5 / 9 | |
| crc_errors_day | integer |  | Number of data packets containing CRC errors over the local day unless manually reset by user, updates every minute|
| dew_point | float | degrees Fahrenheit | Most recent derived dew point|
| et_day | float | inches | Sum of evapotranspiration since local midnight, only calculated hourly|
| et_month | float | inches | Sum of evapotranspiration since local midnight on the first of the month, only calculated hourly|
| et_year | float | inches | Sum of evapotranspiration since local midnight on the first of the month where the month is the user's selected month for the start of their rain year, only calculated hourly|
| freq_error_current | integer |  | Current radio frequency error of the radio packets received, updates every packet|
| freq_error_total | integer |  | Cumulative radio frequency error of the last packet received, updates every packet|
| freq_index | integer |  | Frequency Index of Last Packet Received, updates every packet|
| hdd_day | float | heating degree days in degrees Fahrenheit, to convert to an equivalent Celsius value use C = F x 5 / 9 | |
| heat_index | float | degrees Fahrenheit | Most recent derived heat index|
| hum | float | percent relative humidity | Most recent humidity reading|
| last_packet_received_timestamp | long | TODO | Unix timestamp of last DavisTalk packet that was received. Null if no packets have been received since this transmitter was configured or set|
| packets_missed_day | integer |  | Total number of packets that are missed for any reason over the local day unless manually reset by user, updates every minute|
| packets_missed_streak | integer |  | Current number of missed packets in a row that are missed for any reason, can be reset by user at any time, updates every minute|
| packets_missed_streak_hi_day | integer |  | Longest streak of consecutive packets received over the archive interval|
| packets_received_day | integer |  | Total number of received packets over the local day unless manually reset by user, updates every packet|
| packets_received_streak | integer |  | Current number of packets received in a row, updates every minute|
| packets_received_streak_hi_day | integer |  | Longest Streak of Packets Received in a row over the local day unless manually reset by user, updates every minute|
| rain_rate_hi_clicks | integer | clicks | Highest rain rate over the last 1 minute|
| rain_rate_hi_in | float | inches | Highest rain rate over the last 1 minute|
| rain_rate_hi_last_15_min_clicks | integer | clicks | Highest rain rate over the last 15 minutes|
| rain_rate_hi_last_15_min_in | float | inches | Highest rain rate over the last 15 minutes|
| rain_rate_hi_last_15_min_mm | float | millimeters | Highest rain rate over the last 15 minutes|
| rain_rate_hi_mm | float | millimeters | Highest rain rate over the last 1 minute|
| rain_rate_last_clicks | integer | clicks | Most recent rain rate|
| rain_rate_last_in | float | inches | Most recent rain rate|
| rain_rate_last_mm | float | millimeters | Most recent rain rate|
| rain_size | integer | 1 = 0.01 inch; 2 = 0.2 mm; 3 = 0.1 mm; 4 = 0.001 inch | Rain collector size|
| rain_storm_current_clicks | integer | clicks | Total rain in the current storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rain_storm_current_in | float | inches | Total rain in the current storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rain_storm_current_mm | float | millimeters | Total rain in the current storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rain_storm_current_start_at | long | seconds | Unix timestamp of the start of the current storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rain_storm_last_clicks | integer | clicks | Total rain in the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rain_storm_last_end_at | long | seconds | Unix timestamp of the end of the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rain_storm_last_in | float | inches | Total rain in the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rain_storm_last_mm | float | millimeters | Total rain in the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rain_storm_last_start_at | long | seconds | Unix timestamp of the start of the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)|
| rainfall_day_clicks | integer | clicks | Total rain since local midnight|
| rainfall_day_in | float | inches | Total rain since local midnight|
| rainfall_day_mm | float | millimeters | Total rain since local midnight|
| rainfall_last_15_min_clicks | integer | clicks | Total rain over the last 15 minutes|
| rainfall_last_15_min_in | float | inches | Total rain over the last 15 minutes|
| rainfall_last_15_min_mm | float | millimeters | Total rain over the last 15 minutes|
| rainfall_last_24_hr_clicks | integer | clicks | Total rain over the last 24 hours|
| rainfall_last_24_hr_in | float | inches | Total rain over the last 24 hours|
| rainfall_last_24_hr_mm | float | millimeters | Total rain over the last 24 hours|
| rainfall_last_60_min_clicks | integer | clicks | Total rain over the last 60 minutes|
| rainfall_last_60_min_in | float | inches | Total rain over the last 60 minutes|
| rainfall_last_60_min_mm | float | millimeters | Total rain over the last 60 minutes|
| rainfall_month_clicks | integer | clicks | Total rain since local midnight on the first of the month|
| rainfall_month_in | float | inches | Total rain since local midnight on the first of the month|
| rainfall_month_mm | float | millimeters | Total rain since local midnight on the first of the month|
| rainfall_year_clicks | integer | clicks | Total rain since local midnight on the first of the month where the month is the user's selected month for the start of their rain year|
| rainfall_year_in | float | inches | Total rain since local midnight on the first of the month where the month is the user's selected month for the start of their rain year|
| rainfall_year_mm | float | millimeters | Total rain since local midnight on the first of the month where the month is the user's selected month for the start of their rain year|
| reception_day | integer | percent | Percentage of packets received versus total possible over the local day once synced unless manually reset by user, updates every packet (null when not yet synced)|
| resyncs_day | integer |  | Total number of resyncs since local midnight unless manually reset by user. The console will attempt to resynchronize with the station after 20 consecutive bad packets, updates every minute|
| rssi_last | integer | decibel-milliwatts | DavisTalk Received Signal Strength Indication (RSSI) of last packet received, updates every packet|
| rx_state | integer |  | Configured Receiver State, updates every minute <br />0 = Synced & Tracking OK.<br />1 = Synced (missing less than 20 DavisTalk packets in a row). <br />2 = Scanning (after missing 20 DavisTalk packets in a row).<br /> State at end of interval.|
| solar_energy_day | double | langleys | Daily accumulation of solar energy since local midnight|
| solar_panel_volt | float | volts | Current transmitter solar panel voltage|
| solar_rad | integer | watts per square meter | Most recent solar radiation reading|
| spars_rpm | integer | RPM | Current SPARS RPM|
| spars_volt | float | volts | Current SPARS battery voltage|
| supercap_volt | float | volts | Current transmitter super capacitor voltage|
| temp | float | degrees Fahrenheit | Most recent temperature reading|
| thsw_index | float | degrees Fahrenheit | Most recent derived temperature, humidity, solar, wind index|
| thw_index | float | degrees Fahrenheit | Most recent derived temperature, humidity, wind index|
| trans_battery_flag | integer |  | 0 = battery OK. 1 = battery low.|
| trans_battery_volt | float | volts | Current transmitter battery voltage|
| ts |   integer | Unix timestamp of the data record|
| tx_id | integer | the transmitter ID that the outdoor integrated sensor suite is broadcasting on|
| tz_offset | long | offset in seconds from UTC based on the selected timezone for the station|^
| uv_dose_day | double | minimum erythemal dose | Total UV Dose since local midnight or since last user reset|
| uv_index | float | ultraviolet index | Most recent UV index|
| wbgt | float | degrees Fahrenheit | Most recent derived wet bulb globe temperature|
| wet_bulb | float | degrees Fahrenheit | Most recent derived wet bulb|
| wind_chill | float | degrees Fahrenheit | Most recent derived wind chill|
| wind_dir_at_hi_speed_last_10_min | integer | degrees | Direction of maximum wind speed over last 10 minutes|
| wind_dir_at_hi_speed_last_2_min | integer | degrees | Direction of maximum wind speed over last 2 minutes|
| wind_dir_last | integer | degrees | Most recent wind direction value|
| wind_dir_scalar_avg_last_10_min | integer | degrees | Scalar average wind direction over last 10 minutes|
| wind_dir_scalar_avg_last_1_min | integer | degrees | Scalar average wind direction over last 1 minute|
| wind_dir_scalar_avg_last_2_min | integer | degrees | Scalar average wind direction over last 2 minutes|
| wind_run_day | double | miles | Daily accumulation of wind run since local midnight|
| wind_speed_avg_last_10_min | float | miles per hour | Average wind speed over last 10 minutes|
| wind_speed_avg_last_1_min | float | miles per hour | Average wind speed over last 1 minute|
| wind_speed_avg_last_2_min | float | miles per hour | Average wind speed over last 2 minutes|
| wind_speed_hi_last_10_min | float | miles per hour | Maximum wind speed over last 10 minutes|
| wind_speed_hi_last_2_min | float | miles per hour | Maximum wind speed over last 2 minutes|
| wind_speed_last | float | miles per hour | Most recent wind speed value|
