//
// Created by matteo on 29/12/23
// Copyright (C) 2023  Mattoje
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2,
// as published by the Free Software Foundation.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

import SwiftUI
import Foundation
// MARK: - Sensors
struct Sensors: Codable {
    let stationIDUUID: String
    let sensors: [Sensor]
    let generatedAt, stationID: Int

    enum CodingKeys: String, CodingKey {
        case stationIDUUID = "station_id_uuid"
        case sensors
        case generatedAt = "generated_at"
        case stationID = "station_id"
    }
}

// MARK: - Sensor
struct Sensor: Codable {
    let lsid: Int
    let data: [Datum]
    let sensorType, dataStructureType: Int

    enum CodingKeys: String, CodingKey {
        case lsid, data
        case sensorType = "sensor_type"
        case dataStructureType = "data_structure_type"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let batteryVoltage, wifiRssi: Int?
    let consoleRadioVersion: String?
    let consoleAPILevel, gnssSIPTxID: Int?
    let ipV4Gateway: String?
    let bgn: Int?
    let queueKilobytes, freeMem, systemFreeSpace: Int?
    let tzOffset: Int
    let chargerPlugged, batteryPercent: Int?
    let localAPIQueries: Int?
    let healthVersion: Int?
    let ipAddressType: Int?
    let linkUptime, rxKilobytes: Int?
    let ipV4Netmask, consoleSwVersion: String?
    let connectionUptime, osUptime, batteryCondition, internalFreeSpace: Int?
    let batteryCurrent: Double?
    let batteryStatus, databaseKilobytes, batteryCycleCount: Int?
    let consoleOSVersion, ipV4Address: String?
    let bootloaderVersion, clockSource, appUptime: Int?
    let dnsTypeUsed: Int?
    let batteryTemp, txKilobytes: Int?
    let ts: Int
    let barAbsolute, barSeaLevel: Double?
    let barOffset: Int?
    let barTrend, tempIn, wetBulbIn, heatIndexIn: Double?
    let dewPointIn: Double?
    let wbgtIn: Double?
    let humIn: Double?
    let rxState, windSpeedHiLast2_Min: Int?
    let hum: Double?
    let freqIndex, lastPacketReceivedTimestamp, rainfallDayClicks, packetsMissedDay: Int?
    let windDirAtHiSpeedLast10_Min: Int?
    let windChill, etMonth: Double?
    let packetsReceivedStreakHiDay, rainRateHiLast15_MinClicks: Int?
    let thwIndex: Double?
    let packetsReceivedStreak, freqErrorCurrent, windDirScalarAvgLast10_Min: Int?
    let solarEnergyDay: Double?
    let sparsRPM: Int?
    let windRunDay: Double?
    let rainSize, uvIndex: Int?
    let rainStormCurrentIn: Double?
    let rainfallDayMm, windSpeedLast, resyncsDay, rainfallLast60_MinClicks: Int?
    let wetBulb: Double?
    let rainStormCurrentMm: Double?
    let rainfallDayIn: Int?
    let hddDay, windSpeedAvgLast10_Min: Double?
    let windDirAtHiSpeedLast2_Min: Int?
    let supercapVolt: Double?
    let solarPanelVolt: Double?
    let windDirLast, rainfallMonthClicks, rainStormLastClicks, txID: Int?
    let rainStormLastStartAt, packetsReceivedDay, rainfallLast15_MinIn, rainRateHiClicks: Int?
    let rainfallLast15_MinMm: Int?
    let dewPoint: Double?
    let rainRateHiIn, rainRateHiMm, rainfallYearClicks, rainStormLastEndAt: Int?
    let windDirScalarAvgLast2_Min, receptionDay: Int?
    let wbgt: Double?
    let heatIndex: Double?
    let rainfallLast24_HrIn, rainfallLast60_MinMm: Int?
    let rainStormCurrentClicks: Int?
    let transBatteryFlag, rainfallLast60_MinIn, rainfallLast24_HrMm, crcErrorsDay: Int?
    let rainfallYearIn: Double?
    let rssiLast, windSpeedHiLast10_Min, rainfallLast15_MinClicks, cddDay: Int?
    let rainfallYearMm: Double?
    let freqErrorTotal, windDirScalarAvgLast1_Min: Int?
    let uvDoseDay, temp: Double?
    let transBatteryVolt: Double?
    let etDay, rainfallMonthIn, windSpeedAvgLast2_Min: Double?
    let rainStormCurrentStartAt: Int?
    let sparsVolt: Double?
    let solarRAD: Int?
    let rainStormLastMm, windSpeedAvgLast1_Min, thswIndex: Double?
    let rainRateLastMm, rainRateLastClicks, rainfallLast24_HrClicks: Int?
    let rainStormLastIn, etYear: Double?
    let packetsMissedStreakHiDay, rainRateLastIn, rainRateHiLast15_MinMm, rainRateHiLast15_MinIn: Int?
    let rainfallMonthMm: Double?
    let packetsMissedStreak: Int?

    enum CodingKeys: String, CodingKey {
        case batteryVoltage = "battery_voltage"
        case wifiRssi = "wifi_rssi"
        case consoleRadioVersion = "console_radio_version"
        case consoleAPILevel = "console_api_level"
        case gnssSIPTxID = "gnss_sip_tx_id"
        case ipV4Gateway = "ip_v4_gateway"
        case bgn
        case queueKilobytes = "queue_kilobytes"
        case freeMem = "free_mem"
        case systemFreeSpace = "system_free_space"
        case tzOffset = "tz_offset"
        case chargerPlugged = "charger_plugged"
        case batteryPercent = "battery_percent"
        case localAPIQueries = "local_api_queries"
        case healthVersion = "health_version"
        case ipAddressType = "ip_address_type"
        case linkUptime = "link_uptime"
        case rxKilobytes = "rx_kilobytes"
        case ipV4Netmask = "ip_v4_netmask"
        case consoleSwVersion = "console_sw_version"
        case connectionUptime = "connection_uptime"
        case osUptime = "os_uptime"
        case batteryCondition = "battery_condition"
        case internalFreeSpace = "internal_free_space"
        case batteryCurrent = "battery_current"
        case batteryStatus = "battery_status"
        case databaseKilobytes = "database_kilobytes"
        case batteryCycleCount = "battery_cycle_count"
        case consoleOSVersion = "console_os_version"
        case ipV4Address = "ip_v4_address"
        case bootloaderVersion = "bootloader_version"
        case clockSource = "clock_source"
        case appUptime = "app_uptime"
        case dnsTypeUsed = "dns_type_used"
        case batteryTemp = "battery_temp"
        case txKilobytes = "tx_kilobytes"
        case ts
        case barAbsolute = "bar_absolute"
        case barSeaLevel = "bar_sea_level"
        case barOffset = "bar_offset"
        case barTrend = "bar_trend"
        case tempIn = "temp_in"
        case wetBulbIn = "wet_bulb_in"
        case heatIndexIn = "heat_index_in"
        case dewPointIn = "dew_point_in"
        case wbgtIn = "wbgt_in"
        case humIn = "hum_in"
        case rxState = "rx_state"
        case windSpeedHiLast2_Min = "wind_speed_hi_last_2_min"
        case hum
        case freqIndex = "freq_index"
        case lastPacketReceivedTimestamp = "last_packet_received_timestamp"
        case rainfallDayClicks = "rainfall_day_clicks"
        case packetsMissedDay = "packets_missed_day"
        case windDirAtHiSpeedLast10_Min = "wind_dir_at_hi_speed_last_10_min"
        case windChill = "wind_chill"
        case etMonth = "et_month"
        case packetsReceivedStreakHiDay = "packets_received_streak_hi_day"
        case rainRateHiLast15_MinClicks = "rain_rate_hi_last_15_min_clicks"
        case thwIndex = "thw_index"
        case packetsReceivedStreak = "packets_received_streak"
        case freqErrorCurrent = "freq_error_current"
        case windDirScalarAvgLast10_Min = "wind_dir_scalar_avg_last_10_min"
        case solarEnergyDay = "solar_energy_day"
        case sparsRPM = "spars_rpm"
        case windRunDay = "wind_run_day"
        case rainSize = "rain_size"
        case uvIndex = "uv_index"
        case rainStormCurrentIn = "rain_storm_current_in"
        case rainfallDayMm = "rainfall_day_mm"
        case windSpeedLast = "wind_speed_last"
        case resyncsDay = "resyncs_day"
        case rainfallLast60_MinClicks = "rainfall_last_60_min_clicks"
        case wetBulb = "wet_bulb"
        case rainStormCurrentMm = "rain_storm_current_mm"
        case rainfallDayIn = "rainfall_day_in"
        case hddDay = "hdd_day"
        case windSpeedAvgLast10_Min = "wind_speed_avg_last_10_min"
        case windDirAtHiSpeedLast2_Min = "wind_dir_at_hi_speed_last_2_min"
        case supercapVolt = "supercap_volt"
        case solarPanelVolt = "solar_panel_volt"
        case windDirLast = "wind_dir_last"
        case rainfallMonthClicks = "rainfall_month_clicks"
        case rainStormLastClicks = "rain_storm_last_clicks"
        case txID = "tx_id"
        case rainStormLastStartAt = "rain_storm_last_start_at"
        case packetsReceivedDay = "packets_received_day"
        case rainfallLast15_MinIn = "rainfall_last_15_min_in"
        case rainRateHiClicks = "rain_rate_hi_clicks"
        case rainfallLast15_MinMm = "rainfall_last_15_min_mm"
        case dewPoint = "dew_point"
        case rainRateHiIn = "rain_rate_hi_in"
        case rainRateHiMm = "rain_rate_hi_mm"
        case rainfallYearClicks = "rainfall_year_clicks"
        case rainStormLastEndAt = "rain_storm_last_end_at"
        case windDirScalarAvgLast2_Min = "wind_dir_scalar_avg_last_2_min"
        case receptionDay = "reception_day"
        case wbgt
        case heatIndex = "heat_index"
        case rainfallLast24_HrIn = "rainfall_last_24_hr_in"
        case rainfallLast60_MinMm = "rainfall_last_60_min_mm"
        case rainStormCurrentClicks = "rain_storm_current_clicks"
        case transBatteryFlag = "trans_battery_flag"
        case rainfallLast60_MinIn = "rainfall_last_60_min_in"
        case rainfallLast24_HrMm = "rainfall_last_24_hr_mm"
        case crcErrorsDay = "crc_errors_day"
        case rainfallYearIn = "rainfall_year_in"
        case rssiLast = "rssi_last"
        case windSpeedHiLast10_Min = "wind_speed_hi_last_10_min"
        case rainfallLast15_MinClicks = "rainfall_last_15_min_clicks"
        case cddDay = "cdd_day"
        case rainfallYearMm = "rainfall_year_mm"
        case freqErrorTotal = "freq_error_total"
        case windDirScalarAvgLast1_Min = "wind_dir_scalar_avg_last_1_min"
        case uvDoseDay = "uv_dose_day"
        case temp
        case transBatteryVolt = "trans_battery_volt"
        case etDay = "et_day"
        case rainfallMonthIn = "rainfall_month_in"
        case windSpeedAvgLast2_Min = "wind_speed_avg_last_2_min"
        case rainStormCurrentStartAt = "rain_storm_current_start_at"
        case sparsVolt = "spars_volt"
        case solarRAD = "solar_rad"
        case rainStormLastMm = "rain_storm_last_mm"
        case windSpeedAvgLast1_Min = "wind_speed_avg_last_1_min"
        case thswIndex = "thsw_index"
        case rainRateLastMm = "rain_rate_last_mm"
        case rainRateLastClicks = "rain_rate_last_clicks"
        case rainfallLast24_HrClicks = "rainfall_last_24_hr_clicks"
        case rainStormLastIn = "rain_storm_last_in"
        case etYear = "et_year"
        case packetsMissedStreakHiDay = "packets_missed_streak_hi_day"
        case rainRateLastIn = "rain_rate_last_in"
        case rainRateHiLast15_MinMm = "rain_rate_hi_last_15_min_mm"
        case rainRateHiLast15_MinIn = "rain_rate_hi_last_15_min_in"
        case rainfallMonthMm = "rainfall_month_mm"
        case packetsMissedStreak = "packets_missed_streak"
    }
}
