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
                Task.init{
                    (externalTemp,isConnected,connOnStartup,connStatus) = await startupconn(stationId,stationApiKey,stationApiSecret)
                }
            }
        }
        .onAppear(){
            if (connOnStartup){
                Task.init{
                    (externalTemp,isConnected,connOnStartup,connStatus) = await startupconn(stationId,stationApiKey,stationApiSecret)
                }
            }
        }
    }
}

#Preview {
    MenuBarView(externalTemp: .constant(100), isConnected: .constant(true), connStatus: .constant("Connected at time"))
}
#Preview {
    MenuBarView(externalTemp: .constant(0), isConnected: .constant(false), connStatus: .constant("Disconnected"))
}
