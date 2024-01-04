//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 02/01/24
// Copyright (C) 2024  Mattoje
//

import Foundation
let myISSid=43 //Vantage Pro2 Wireless

func getDataFromMyWeatherlink(_ stationId: String,_ stationApiKey:String,_ stationApiSecret:String) async -> (responseJson: Data,status: Bool) {
    let url = URL(string: "https://api.weatherlink.com/v2/current/\(stationId)?api-key=\(stationApiKey)")!
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
func startupconn(_ stationId: String,_ stationApiKey:String,_ stationApiSecret:String) async ->(celsiusTemp: Double,isConnected:Bool,connOnStartup: Bool,connStatus:String){
    if (stationId != "" && stationApiKey != "" && stationApiSecret != "" ) {
            let (jsondata,cstatus) = await getDataFromMyWeatherlink(stationId,stationApiKey,stationApiSecret)
            if cstatus{
                if let sensorsList = try? JSONDecoder().decode(WeatherLinkResults.self, from: jsondata) {
                    if let tempSensor = sensorsList.sensors.first(where: {$0.sensor_type == myISSid}) {
                        let celsiusTemp = (tempSensor.data[0].temp! - 32) * 5/9
                        let formatter = DateFormatter()
                        formatter.dateStyle = .medium
                        formatter.timeStyle = .long
                        return (celsiusTemp,true,true,"Connected: "+formatter.string(from: Date()))
                    } else {
                        return (-235,false,false,"No Sensors Detected")
                    }
                }
                else {
                    return (-235,false,false,"Json Decoding Error")
                }
            } else {
                return (-235,false,false,"Json Decoding Error unknown")
            }
    }
    else {
        return (-235,false,false,"Fill all the required fields")
    }
}
