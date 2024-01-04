//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 30/12/23
// Copyright (C) 2023  Mattoje
//


import SwiftUI

struct MenuBarView: View {
    let timer = Timer.publish(every: 900, on: .main, in: .common).autoconnect()
    @AppStorage("stationId") var stationId = ""
    @AppStorage("stationApiKey") var stationApiKey = ""
    @AppStorage("stationApiSecret") var stationApiSecret = ""
    @AppStorage("connOnStartup") var connOnStartup = false
    @Binding var externalTemp:Double
    @Binding var isConnected:Bool
    @Binding var connStatus:String
    var body: some View {
        HStack(alignment: .center){
            if isConnected==true{
                Text("\(externalTemp, specifier: "%.1f")°")
            } else{
                Image(systemName: "thermometer.medium.slash").resizable()
            }
            
        }.onReceive(timer) {_ in
            if (connOnStartup){
                startupconn()
            }
        }
        .onAppear(){
            if (connOnStartup){
                startupconn()
            }
        }
    }
    func startupconn(){
        if (stationId != "" && stationApiKey != "" && stationApiSecret != "" ) {
            Task.init{
                let (jsondata,cstatus) = await getDataFromMyWeatherlink(stationId,stationApiKey,stationApiSecret)
                if cstatus{
                    if let sensorsList = try? JSONDecoder().decode(WeatherLinkResults.self, from: jsondata) {
                        if let tempSensor = sensorsList.sensors.first(where: {$0.sensor_type == myISSid}) {
                            let celsiusTemp = (tempSensor.data[0].temp! - 32) * 5/9
                            externalTemp=celsiusTemp
                            isConnected=true
                            connOnStartup = true
                            let formatter = DateFormatter()
                            formatter.dateStyle = .medium
                            formatter.timeStyle = .long
                            connStatus="Connected: "+formatter.string(from: Date())
                        } else {
                            isConnected=false
                            connStatus="No Sensors Detected"
                        }
                    }
                    else {
                        isConnected=false
                        connStatus="Json Decoding Error"
                    }
                } else {
                    isConnected=false
                    connStatus=String(decoding: jsondata, as: UTF8.self)
                }
            }
        }
        else {
            connStatus="Fill all the required fields"
        }
    }
    
}

#Preview {
    MenuBarView(externalTemp: .constant(100), isConnected: .constant(true), connStatus: .constant("Connected at time"))
}
#Preview {
    MenuBarView(externalTemp: .constant(0), isConnected: .constant(false), connStatus: .constant("Disconnected"))
}
