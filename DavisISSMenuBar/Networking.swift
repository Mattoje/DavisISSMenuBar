//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 02/01/24
// Copyright (C) 2024  Mattoje
//

import Foundation


func getDataFromMyWeatherlink(_ stationUUID: String,_ stationApiKey:String,_ stationApiSecret:String) async -> (responseJson: Data,status: Bool) {
    let url = URL(string: "https://api.weatherlink.com/v2/current/\(stationUUID)?api-key=\(stationApiKey)")!
    var request = URLRequest(url: url)
    request.setValue(stationApiSecret,forHTTPHeaderField:"X-Api-Secret")
    do {
        let (data,response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else {
            return (Data("Guard response failed".utf8),false)
        }
        if response.statusCode==401 {
            return (Data("Error 401".utf8),false)
        }
        if response.statusCode==404 {
            return (Data("Error 404".utf8),false)
        }
        return (data,true)
    }
    catch {
        if let error = error as? URLError {
            return(Data(error.localizedDescription.utf8),false)
        }
        return (Data("Unknown Error".utf8),false)
    }
}
func startupconn(_ stationUUID: String,_ stationApiKey:String,_ stationApiSecret:String) async ->(celsiusTemp: Double,rainRate: Double,windAvg2Min: Double,isConnected:Bool,connOnStartup: Bool,connStatus:String){
    if (stationUUID != "" && stationApiKey != "" && stationApiSecret != "" ) {
        let (jsondata,cstatus) = await getDataFromMyWeatherlink(stationUUID,stationApiKey,stationApiSecret)
        if cstatus{
            if let sensorsList = try? JSONDecoder().decode(WeatherLinkResults.self, from: jsondata) {
                if let tempSensor = sensorsList.sensors.first(where: {$0.sensor_type == myISSid}) {
                    if let temp  = tempSensor.data[0].temp {
                        let formatter = DateFormatter()
                        formatter.dateStyle = .medium
                        formatter.timeStyle = .short
                        if let rainRate = tempSensor.data[0].rain_rate_last_mm{
                            if let windAvg2Min=tempSensor.data[0].wind_speed_avg_last_2_min {
                                
                                return ((temp - 32) * 5/9,rainRate,(windAvg2Min*1.60934),true,true,"Connected: "+formatter.string(from: Date()))
                            }
                            else {
                                return (-235,0,-1,false,false,"Wind Sensor Malfunction")
                            }
                        }
                        else {
                            return (-235,0,-1,false,false,"Rain Sensor Malfunction")
                        }
                    }
                    else {
                        return (-235,0,-1,false,false,"Temp Sensor Malfunction")
                    }
                }
                else {
                    return (-235,0,-1,false,false,"No Sensors Detected")
                }
            }
            else {
                return (-235,0,-1,false,false,"Json Decoding Error")
            }
        } else {
            return (-235,0,-1,false,false,String(decoding: jsondata, as: UTF8.self))
        }
    }
    else {
        return (-235,0,-1,false,false,"Fill all the required fields")
    }
}
