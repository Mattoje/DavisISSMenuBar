//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 30/12/23
// Copyright (C) 2023  Mattoje
//


import SwiftUI

struct MenuBarView: View {
    let timer = Timer.publish(every: pollTime, on: .main, in: .common).autoconnect()
    @AppStorage("stationUUID") var stationUUID = ""
    @AppStorage("stationApiKey") var stationApiKey = ""
    @AppStorage("stationApiSecret") var stationApiSecret = ""
    @AppStorage("connOnStartup") var connOnStartup = false
    @Binding var externalTemp:Double
    @Binding var rainRate:Double
    @Binding var windSpeedAvgLast2Min:Double
    @Binding var isConnected:Bool
    @Binding var connStatus:String
    @Binding var networkLocked:Bool
    @Binding var consoleOsVersion:String
    @Binding var consoleRadioVersion:String
    @Binding var consoleFwVersion:String
    var body: some View {
        HStack(alignment: .top){
            if isConnected==true{
                if (rainRate>0){
                    windSpeedAvgLast2Min>0 ? Image("martin.noun.wind.rain"):Image(systemName: "cloud.rain")
                }
                else {
                    if (windSpeedAvgLast2Min>0){
                        Image(systemName: "wind")
                    }
                }
                Text("\(externalTemp, specifier: "%.1f") °C")
            } else{
                Image(systemName: "thermometer.medium.slash").resizable()
            }
            
            
        }.onReceive(timer) {_ in
            
            if (connOnStartup && !networkLocked){
                networkLocked=true
                Task.init{
                    (externalTemp,rainRate,windSpeedAvgLast2Min,consoleOsVersion,consoleRadioVersion,consoleFwVersion,isConnected,connOnStartup,connStatus) = await startupconn(stationUUID,stationApiKey,stationApiSecret)
                }
                networkLocked=false
            }
        }
        .onAppear(){
            if (connOnStartup && !networkLocked){
                networkLocked=true
                Task.init{
                    (externalTemp,rainRate,windSpeedAvgLast2Min,consoleOsVersion,consoleRadioVersion,consoleFwVersion,isConnected,connOnStartup,connStatus) = await startupconn(stationUUID,stationApiKey,stationApiSecret)
                }
                networkLocked=false
            }
        }
    }
}

#Preview {
    MenuBarView(externalTemp: .constant(20), rainRate: .constant(0), windSpeedAvgLast2Min: .constant(0),isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(true),consoleOsVersion:.constant("10"),consoleRadioVersion:.constant("11"),consoleFwVersion:.constant("12"))
}
#Preview {
    MenuBarView(externalTemp: .constant(100), rainRate: .constant(1), windSpeedAvgLast2Min: .constant(0), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(false),consoleOsVersion:.constant("10"),consoleRadioVersion:.constant("11"),consoleFwVersion:.constant("12"))
}
#Preview {
    MenuBarView(externalTemp: .constant(100), rainRate: .constant(0), windSpeedAvgLast2Min: .constant(1), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(false),consoleOsVersion:.constant("10"),consoleRadioVersion:.constant("11"),consoleFwVersion:.constant("12"))
}
#Preview {
    MenuBarView(externalTemp: .constant(100), rainRate: .constant(1), windSpeedAvgLast2Min: .constant(1), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(false),consoleOsVersion:.constant("10"),consoleRadioVersion:.constant("11"),consoleFwVersion:.constant("12"))
}
#Preview {
    MenuBarView(externalTemp: .constant(0), rainRate: .constant(0), windSpeedAvgLast2Min: .constant(0), isConnected: .constant(false), connStatus: .constant("Disconnected"),networkLocked:.constant(false),consoleOsVersion:.constant("10"),consoleRadioVersion:.constant("11"),consoleFwVersion:.constant("12"))
}
