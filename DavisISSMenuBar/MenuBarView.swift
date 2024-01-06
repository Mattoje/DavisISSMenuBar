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
    @Binding var networkLocked:Bool
    var body: some View {
        HStack(alignment: .center){
            if isConnected==true{
                Text("\(externalTemp, specifier: "%.1f")°")
            } else{
                Image(systemName: "thermometer.medium.slash").resizable()
            }
            
        }.onReceive(timer) {_ in
            if (connOnStartup && !networkLocked){
                networkLocked=true
                Task.init{
                    (externalTemp,isConnected,connOnStartup,connStatus) = await startupconn(stationId,stationApiKey,stationApiSecret)
                }
                networkLocked=false
            }
        }
        .onAppear(){
            if (connOnStartup && !networkLocked){
                networkLocked=true
                Task.init{
                    (externalTemp,isConnected,connOnStartup,connStatus) = await startupconn(stationId,stationApiKey,stationApiSecret)
                }
                networkLocked=false
            }
        }
    }
}

#Preview {
    MenuBarView(externalTemp: .constant(100), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(false))
}
#Preview {
    MenuBarView(externalTemp: .constant(0), isConnected: .constant(false), connStatus: .constant("Disconnected"),networkLocked:.constant(false))
}
