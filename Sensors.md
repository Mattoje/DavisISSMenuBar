#  A list of all the sensors, including the console itself
# https://weatherlink.github.io/v2-api/interactive-sensor-catalog

# Console Health: sensor type 509
health_version    integer        Health data structure version number
console_sw_version    string        Console application version number
console_radio_version    string        Radio firmware version number
console_api_level    long        API level version number
battery_voltage    integer    millivolts    Battery voltage
battery_percent    integer    percentage    Battery charge

battery_condition    integer        Battery health condition:
                                    1: Unknown
                                    2: Good
                                    3: Overheat
                                    4: Dead
                                    5: Overvoltage
                                    6: Unspecified Failure
                                    7: Cold
                                    
battery_current    float    milliamps    Positive means the battery is charging while negative means the battery is discharging
battery_temp    float    degrees Celsius    Battery temperature

charger_plugged    integer        Power charger plugged in status:
                                    0: Unplugged
                                    1: Plugged in
                                    
battery_status    integer        Battery charge status:
                                    1: Unknown
                                    2: Charging
                                    3: Discharging
                                    4: Not charging
                                    5: Full
                                    
os_uptime    long    seconds    Uptime since last reboot
app_uptime    long    seconds    Uptime since last app restart
bgn    integer        Background Noise level of DavisTalk radio receiver

ip_address_type    integer        IP address type:
                                    1: Dynamic
                                    2: Dyn DNS Override
                                    3: Static
                                    
ip_v4_address    string        IP Address of the Console
ip_v4_gateway    string        IP Address of the LAN’s Router or Gateway
ip_v4_netmask    string        IP Address of the Subnet Mask
dns_type_used    integer        DNS used (1=Primary, 2=Secondary, 3=public) if available
rx_kilobytes    long    1000 bytes    Total Bytes received on network interface
tx_kilobytes    long    1000 bytes    Total Bytes sent on network interface
local_api_queries    long        Local API queries served
wifi_rssi    integer    decibel-milliwatts    WiFi Signal Strength
link_uptime    long    seconds    Uptime since last WiFi network loss
connection_uptime    long    seconds    Uptime since last upload connection loss
bootloader_version    long        Bootloader version
clock_source    integer        0: Unset, 1: User, 2: Network, 3: GNSS
gnss_sip_tx_id    integer        
free_mem    long    kilobytes    Available internal RAM in KB
internal_free_space    long    kilobytes    Available space in the storage partition in KB
system_free_space    long    kilobytes    Available space in the system partition in KB
queue_kilobytes    long    kilobytes    Backend upload record queue size in KB
database_kilobytes    long    kilobytes    Onboard database size in KB
battery_cycle_count    long        Number of times the battery has used the equivalent of a full battery charge since the last counter reset
console_os_version    string        Console operating system version number
ts integer 
tz_offset long

# Barometer: sensor type 242
bar_sea_level    float    inches of mercury    
bar_trend    float    inches of mercury    
bar_absolute    float    inches of mercury    
bar_offset    float    inches of mercury

# Inside Temp and Hum: Sensor Type 365

temp_in    float    degrees Fahrenheit    Most recent inside temperature reading
hum_in    float    percent relative humidity    Most recent inside humidity reading
dew_point_in    float    degrees Fahrenheit    Most recent inside dew point reading
wet_bulb_in    float    degrees Fahrenheit    Most recent inside wet buld reading
heat_index_in    float    degrees Fahrenheit    Most recent inside heat index reading
wbgt_in    float    degrees Fahrenheit    Most recent inside wet bulb globe temperature reading


# Vantage Pro2 Wireless: Sensor Type 43


temp    float    degrees Fahrenheit    Most recent temperature reading
hum    float    percent relative humidity    Most recent humidity reading
dew_point    float    degrees Fahrenheit    Most recent derived dew point
wet_bulb    float    degrees Fahrenheit    Most recent derived wet bulb
heat_index    float    degrees Fahrenheit    Most recent derived heat index
wind_chill    float    degrees Fahrenheit    Most recent derived wind chill
thw_index    float    degrees Fahrenheit    Most recent derived temperature, humidity, wind index
thsw_index    float    degrees Fahrenheit    Most recent derived temperature, humidity, solar, wind index
wbgt    float    degrees Fahrenheit    Most recent derived wet bulb globe temperature
wind_speed_last    float    miles per hour    Most recent wind speed value
wind_dir_last    integer    degrees    Most recent wind direction value
wind_speed_avg_last_1_min    float    miles per hour    Average wind speed over last 1 minute
wind_dir_scalar_avg_last_1_min    integer    degrees    Scalar average wind direction over last 1 minute
wind_speed_avg_last_2_min    float    miles per hour    Average wind speed over last 2 minutes
wind_dir_scalar_avg_last_2_min    integer    degrees    Scalar average wind direction over last 2 minutes
wind_speed_hi_last_2_min    float    miles per hour    Maximum wind speed over last 2 minutes
wind_dir_at_hi_speed_last_2_min    integer    degrees    Direction of maximum wind speed over last 2 minutes
wind_speed_avg_last_10_min    float    miles per hour    Average wind speed over last 10 minutes
wind_dir_scalar_avg_last_10_min    integer    degrees    Scalar average wind direction over last 10 minutes
wind_speed_hi_last_10_min    float    miles per hour    Maximum wind speed over last 10 minutes
wind_dir_at_hi_speed_last_10_min    integer    degrees    Direction of maximum wind speed over last 10 minutes
wind_run_day    double    miles    Daily accumulation of wind run since local midnight
rain_size    integer    1 = 0.01 inch; 2 = 0.2 mm; 3 = 0.1 mm; 4 = 0.001 inch    Rain collector size
rain_rate_last_clicks    integer    clicks    Most recent rain rate
rain_rate_last_in    float    inches    Most recent rain rate
rain_rate_last_mm    float    millimeters    Most recent rain rate
rain_rate_hi_clicks    integer    clicks    Highest rain rate over the last 1 minute
rain_rate_hi_in    float    inches    Highest rain rate over the last 1 minute
rain_rate_hi_mm    float    millimeters    Highest rain rate over the last 1 minute
rainfall_last_15_min_clicks    integer    clicks    Total rain over the last 15 minutes
rainfall_last_15_min_in    float    inches    Total rain over the last 15 minutes
rainfall_last_15_min_mm    float    millimeters    Total rain over the last 15 minutes
rain_rate_hi_last_15_min_clicks    integer    clicks    Highest rain rate over the last 15 minutes
rain_rate_hi_last_15_min_in    float    inches    Highest rain rate over the last 15 minutes
rain_rate_hi_last_15_min_mm    float    millimeters    Highest rain rate over the last 15 minutes
rainfall_last_60_min_clicks    integer    clicks    Total rain over the last 60 minutes
rainfall_last_60_min_in    float    inches    Total rain over the last 60 minutes
rainfall_last_60_min_mm    float    millimeters    Total rain over the last 60 minutes
rainfall_last_24_hr_clicks    integer    clicks    Total rain over the last 24 hours
rainfall_last_24_hr_in    float    inches    Total rain over the last 24 hours
rainfall_last_24_hr_mm    float    millimeters    Total rain over the last 24 hours
rain_storm_current_clicks    integer    clicks    Total rain in the current storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rain_storm_current_in    float    inches    Total rain in the current storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rain_storm_current_mm    float    millimeters    Total rain in the current storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rain_storm_current_start_at    long    seconds    Unix timestamp of the start of the current storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rain_storm_last_clicks    integer    clicks    Total rain in the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rain_storm_last_in    float    inches    Total rain in the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rain_storm_last_mm    float    millimeters    Total rain in the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rain_storm_last_start_at    long    seconds    Unix timestamp of the start of the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rain_storm_last_end_at    long    seconds    Unix timestamp of the end of the previous storm (the first rain recorded after a period of 24 hours or more without rain is considered a new storm)
rainfall_day_clicks    integer    clicks    Total rain since local midnight
rainfall_day_in    float    inches    Total rain since local midnight
rainfall_day_mm    float    millimeters    Total rain since local midnight
rainfall_month_clicks    integer    clicks    Total rain since local midnight on the first of the month
rainfall_month_in    float    inches    Total rain since local midnight on the first of the month
rainfall_month_mm    float    millimeters    Total rain since local midnight on the first of the month
rainfall_year_clicks    integer    clicks    Total rain since local midnight on the first of the month where the month is the user's selected month for the start of their rain year
rainfall_year_in    float    inches    Total rain since local midnight on the first of the month where the month is the user's selected month for the start of their rain year
rainfall_year_mm    float    millimeters    Total rain since local midnight on the first of the month where the month is the user's selected month for the start of their rain year
solar_rad    integer    watts per square meter    Most recent solar radiation reading
solar_energy_day    double    langleys    Daily accumulation of solar energy since local midnight
et_day    float    inches    Sum of evapotranspiration since local midnight, only calculated hourly
et_month    float    inches    Sum of evapotranspiration since local midnight on the first of the month, only calculated hourly
et_year    float    inches    Sum of evapotranspiration since local midnight on the first of the month where the month is the user's selected month for the start of their rain year, only calculated hourly
uv_index    float    ultraviolet index    Most recent UV index
uv_dose_day    double    minimum erythemal dose    Total UV Dose since local midnight or since last user reset
hdd_day    float    heating degree days in degrees Fahrenheit, to convert to an equivalent Celsius value use C = F x 5 / 9    
cdd_day    float    cooling degree days in degrees Fahrenheit, to convert to an equivalent Celsius value use C = F x 5 / 9    
reception_day    integer    percent    Percentage of packets received versus total possible over the local day once synced unless manually reset by user, updates every packet (null when not yet synced)
rssi_last    integer    decibel-milliwatts    DavisTalk Received Signal Strength Indication (RSSI) of last packet received, updates every packet
crc_errors_day    integer        Number of data packets containing CRC errors over the local day unless manually reset by user, updates every minute
resyncs_day    integer        Total number of resyncs since local midnight unless manually reset by user. The console will attempt to resynchronize with the station after 20 consecutive bad packets, updates every minute
packets_received_day    integer        Total number of received packets over the local day unless manually reset by user, updates every packet
packets_received_streak    integer        Current number of packets received in a row, updates every minute
packets_missed_day    integer        Total number of packets that are missed for any reason over the local day unless manually reset by user, updates every minute
packets_missed_streak    integer        Current number of missed packets in a row that are missed for any reason, can be reset by user at any time, updates every minute
packets_received_streak_hi_day    integer        Longest Streak of Packets Received in a row over the local day unless manually reset by user, updates every minute
packets_missed_streak_hi_day    integer        Longest streak of consecutive packets received over the archive interval

rx_state    integer        Configured Receiver State, updates every minute:
                            0 = Synced & Tracking OK.
                            1 = Synced (missing less than 20 DavisTalk packets in a row).
                            2 = Scanning (after missing 20 DavisTalk packets in a row). State at end of interval.
                            
freq_error_current    integer        Current radio frequency error of the radio packets received, updates every packet
freq_error_total    integer        Cumulative radio frequency error of the last packet received, updates every packet
freq_index    integer        Frequency Index of Last Packet Received, updates every packet
last_packet_received_timestamp    long    TODO    Unix timestamp of last DavisTalk packet that was received. Null if no packets have been received since this transmitter was configured or set
trans_battery_flag    integer        0 = battery OK. 1 = battery low.
trans_battery_volt    float    volts    Current transmitter battery voltage
solar_panel_volt    float    volts    Current transmitter solar panel voltage
supercap_volt    float    volts    Current transmitter super capacitor voltage
spars_volt    float    volts    Current SPARS battery voltage
spars_rpm    integer    RPM    Current SPARS RPM
ts integer sara' il time stamp (boh) 
tx_id integer transmission id
tz_offset long timezone offset ? boh
