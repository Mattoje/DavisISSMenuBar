//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 02/01/24
// Copyright (C) 2024  Mattoje
//

import Foundation


func getDataFromMyWeatherlink(_ stationUUID: String,_ stationApiKey:String,_ stationApiSecret:String) async -> (responseJson: Data,status: Bool) {
    guard let url = URL(string: "https://api.weatherlink.com/v2/current/\(stationUUID)?api-key=\(stationApiKey)") else {
        return (Data("Guard url failed".utf8),false)
    }
    var request = URLRequest(url: url)
    request.setValue(stationApiSecret,forHTTPHeaderField:"X-Api-Secret")
    do {
        let (data,response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else {
            return (Data("Guard response failed".utf8),false)
        }
        switch response.statusCode {
            case 200:
                return (data,true)
            case 401:
                return (Data("Error 401: wrong credentials".utf8),false)
            case 404:
                return (Data("Error 404: station not found ".utf8),false)
            default:
                return (Data("Error \(response.statusCode): Unknown Error".utf8),false)
        }
    }
    catch {
        if let error = error as? URLError {
            return(Data(error.localizedDescription.utf8),false)
        }
        return (Data("Unknown Network Error".utf8),false)
    }
}
func startupconn(_ stationUUID: String,_ stationApiKey:String,_ stationApiSecret:String) async ->(celsiusTemp: Double,rainRate: Double,windAvg2Min: Double,RadioVersion: String,SwVersion: String,OsVersion :String,isConnected:Bool,connOnStartup: Bool,connStatus:String){
    if (stationUUID != "" && stationApiKey != "" && stationApiSecret != "" ) {
        let (jsondata,cstatus) = await getDataFromMyWeatherlink(stationUUID,stationApiKey,stationApiSecret)
        if cstatus {
            guard let sensorsList = try? JSONDecoder().decode(WeatherLinkResults.self, from: jsondata) else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"Json Decoding Error")
            }
            guard let workSensor = sensorsList.sensors.first(where: {$0.sensor_type == myISSid}) else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"No Sensors Detected")
            }
            guard let consoleSensor = sensorsList.sensors.first(where: {$0.sensor_type == myConsoleHealth}) else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"No Console Detected")
            }
            guard let temp = workSensor.data[0].temp else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"Temp Sensor Malfunction")
            }
            guard let rainRate = workSensor.data[0].rain_rate_last_mm else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"Rain Sensor Malfunction")
            }
            guard let windAvg2Min = workSensor.data[0].wind_speed_avg_last_2_min else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"Wind Sensor Malfunction")
            }
            guard let OsVersion = consoleSensor.data[0].console_os_version else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"Error Retrieving console os version")
            }
            guard let RadioVersion = consoleSensor.data[0].console_radio_version else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"Error Retrieving console radio version")
            }
            guard let SwVersion = consoleSensor.data[0].console_sw_version else {
                return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"Error Retrieving console sw version")
            }
            
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return ((temp - 32) * 5/9,rainRate,(windAvg2Min*1.60934),OsVersion,RadioVersion,SwVersion,true,true,"Connected: "+formatter.string(from: Date()))
        } else { // if cstatus
            return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,String(decoding: jsondata, as: UTF8.self))
        }
    }// if stationUUID
    else {
        return (-235,0,-1,"Unknown","Unknown","Unknown",false,false,"Fill all the required fields")
    }
}
