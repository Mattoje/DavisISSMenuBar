//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 29/12/23
// Copyright (C) 2023  Mattoje
//

import Foundation
// MARK: - WeatherLinkResults
struct WeatherLinkResults: Codable {
    let station_id_uuid: String
    let sensors: [Sensor]
    let generated_at:Int
    let station_id: Int
}

// MARK: - Sensor
struct Sensor: Codable {
    let lsid: Int
    let data: [Datum]
    let sensor_type:Int
    let data_structure_type:Int
}

// MARK: - Datum

struct Datum: Codable{
    let app_uptime: Int?
    let bar_absolute: Double?
    let bar_offset: Double?
    let bar_sea_level: Double?
    let bar_trend: Double?
    let battery_condition: Int?
    let battery_current: Double?
    let battery_cycle_count: Int?
    let battery_percent: Int?
    let battery_status: Int?
    let battery_temp: Double?
    let battery_voltage: Int?
    let bgn: Int?
    let bootloader_version: Int?
    let cdd_day: Double?
    let charger_plugged: Int?
    let clock_source: Int?
    let connection_uptime: Int?
    let console_api_level: Int?
    let console_os_version: String?
    let console_radio_version: String?
    let console_sw_version: String?
    let crc_errors_day: Int?
    let database_kilobytes: Int?
    let dew_point: Double?
    let dew_point_in: Double?
    let dns_type_used: Int?
    let et_day: Double?
    let et_month: Double?
    let et_year: Double?
    let free_mem: Int?
    let freq_error_current: Int?
    let freq_error_total: Int?
    let freq_index: Int?
    let gnss_sip_tx_id: Int?
    let hdd_day: Double?
    let health_version: Int?
    let heat_index: Double?
    let heat_index_in: Double?
    let hum: Double?
    let hum_in: Double?
    let internal_free_space: Int?
    let ip_address_type: Int?
    let ip_v4_address: String?
    let ip_v4_gateway: String?
    let ip_v4_netmask: String?
    let last_packet_received_timestamp: Int?
    let link_uptime: Int?
    let local_api_queries: Int?
    let os_uptime: Int?
    let packets_missed_day: Int?
    let packets_missed_streak: Int?
    let packets_missed_streak_hi_day: Int?
    let packets_received_day: Int?
    let packets_received_streak: Int?
    let packets_received_streak_hi_day: Int?
    let queue_kilobytes: Int?
    let rain_rate_hi_clicks: Int?
    let rain_rate_hi_in: Double?
    let rain_rate_hi_last_15_min_clicks: Int?
    let rain_rate_hi_last_15_min_in: Double?
    let rain_rate_hi_last_15_min_mm: Double?
    let rain_rate_hi_mm: Double?
    let rain_rate_last_clicks: Int?
    let rain_rate_last_in: Double?
    let rain_rate_last_mm: Double?
    let rain_size: Int?
    let rain_storm_current_clicks: Int?
    let rain_storm_current_in: Double?
    let rain_storm_current_mm: Double?
    let rain_storm_current_start_at: Int?
    let rain_storm_last_clicks: Int?
    let rain_storm_last_end_at: Int?
    let rain_storm_last_in: Double?
    let rain_storm_last_mm: Double?
    let rain_storm_last_start_at: Int?
    let rainfall_day_clicks: Int?
    let rainfall_day_in: Double?
    let rainfall_day_mm: Double?
    let rainfall_last_15_min_clicks: Int?
    let rainfall_last_15_min_in: Double?
    let rainfall_last_15_min_mm: Double?
    let rainfall_last_24_hr_clicks: Int?
    let rainfall_last_24_hr_in: Double?
    let rainfall_last_24_hr_mm: Double?
    let rainfall_last_60_min_clicks: Int?
    let rainfall_last_60_min_in: Double?
    let rainfall_last_60_min_mm: Double?
    let rainfall_month_clicks: Int?
    let rainfall_month_in: Double?
    let rainfall_month_mm: Double?
    let rainfall_year_clicks: Int?
    let rainfall_year_in: Double?
    let rainfall_year_mm: Double?
    let reception_day: Int?
    let resyncs_day: Int?
    let rssi_last: Int?
    let rx_kilobytes: Int?
    let rx_state: Int?
    let solar_energy_day: Double?
    let solar_panel_volt: Double?
    let solar_rad: Int?
    let spars_rpm: Int?
    let spars_volt: Double?
    let supercap_volt: Double?
    let system_free_space: Int?
    let temp: Double?
    let temp_in: Double?
    let thsw_index: Double?
    let thw_index: Double?
    let trans_battery_flag: Int?
    let trans_battery_volt: Double?
    let ts: Int?
    let tx_id: Int?
    let tx_kilobytes: Int?
    let tz_offset: Int?
    let uv_dose_day: Double?
    let uv_index: Double?
    let wbgt: Double?
    let wbgt_in: Double?
    let wet_bulb: Double?
    let wet_bulb_in: Double?
    let wifi_rssi: Int?
    let wind_chill: Double?
    let wind_dir_at_hi_speed_last_10_min: Int?
    let wind_dir_at_hi_speed_last_2_min: Int?
    let wind_dir_last: Int?
    let wind_dir_scalar_avg_last_10_min: Int?
    let wind_dir_scalar_avg_last_1_min: Int?
    let wind_dir_scalar_avg_last_2_min: Int?
    let wind_run_day: Double?
    let wind_speed_avg_last_10_min: Double?
    let wind_speed_avg_last_1_min: Double?
    let wind_speed_avg_last_2_min: Double?
    let wind_speed_hi_last_10_min: Double?
    let wind_speed_hi_last_2_min: Double?
    let wind_speed_last: Double?
}
