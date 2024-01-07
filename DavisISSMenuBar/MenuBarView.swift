//
// SPDX-License-Identifier: GPL-2.0-only
// Created by matteo on 30/12/23
// Copyright (C) 2023  Mattoje
//


import SwiftUI

struct MenuBarView: View {
    let timer = Timer.publish(every: 900, on: .main, in: .common).autoconnect()
    @AppStorage("stationUUID") var stationUUID = ""
    @AppStorage("stationApiKey") var stationApiKey = ""
    @AppStorage("stationApiSecret") var stationApiSecret = ""
    @AppStorage("connOnStartup") var connOnStartup = false
    @Binding var externalTemp:Double
    @Binding var rainRate:Double
    @Binding var isConnected:Bool
    @Binding var connStatus:String
    @Binding var networkLocked:Bool
    var body: some View {
        HStack(alignment: .bottom){
            ZStack(alignment: .bottomTrailing){
                if isConnected==true{
                    
                    Text("\(externalTemp, specifier: "%.1f")°")
                    Divider()
                    if (rainRate>0){
                        Image(systemName: "cloud.drizzle").resizable()
                            .frame(width: 5,height: 5)
                    }
                    
                } else{
                    
                    Image(systemName: "thermometer.medium.slash").resizable()
                    
                }
                Circle()
                    .frame(width: 5,height: 5)
                    .foregroundColor(networkLocked ?.orange : .green)
            }
            
            
        }.onReceive(timer) {_ in
            
            if (connOnStartup && !networkLocked){
                networkLocked=true
                Task.init{
                    (externalTemp,rainRate,isConnected,connOnStartup,connStatus) = await startupconn(stationUUID,stationApiKey,stationApiSecret)
                }
                networkLocked=false
            }
        }
        .onAppear(){
            if (connOnStartup && !networkLocked){
                networkLocked=true
                Task.init{
                    (externalTemp,rainRate,isConnected,connOnStartup,connStatus) = await startupconn(stationUUID,stationApiKey,stationApiSecret)
                }
                networkLocked=false
            }
        }
    }
}

#Preview {
    MenuBarView(externalTemp: .constant(20), rainRate: .constant(0), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(true))
}
#Preview {
    MenuBarView(externalTemp: .constant(100), rainRate: .constant(0), isConnected: .constant(true), connStatus: .constant("Connected at time"),networkLocked:.constant(false))
}
#Preview {
    MenuBarView(externalTemp: .constant(0), rainRate: .constant(0), isConnected: .constant(false), connStatus: .constant("Disconnected"),networkLocked:.constant(false))
}
