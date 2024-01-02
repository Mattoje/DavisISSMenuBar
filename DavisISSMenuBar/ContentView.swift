//
// Created by matteo on 29/12/23
//

import SwiftUI
import Foundation

struct ContentView: View {
    @Binding var externalTemp:Double
    @Binding var isConnected:Bool
    @State private var connStatus:String="Disconnected"
    let myISSid=43 //Vantage Pro2 Wireless
    @AppStorage("stationId") var stationId = ""
    @AppStorage("stationApiKey") var stationApiKey = ""
    @AppStorage("stationApiSecret") var stationApiSecret = ""
    var body: some View {
        VStack {
            Image(systemName: "cloud.sun")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Connection Status: \(connStatus)")
            TextField("Station ID", text: $stationId)
            TextField("Station Api Key", text: $stationApiKey)
            TextField("Station Api Secret", text: $stationApiSecret)
            Button("Connect"){
                Task.init{
                    let (jsondata,cstatus) = await getDataFromMyWeatherlink(stationId,stationApiKey,stationApiSecret)
                    if cstatus{
                        let sensorsList = try? JSONDecoder().decode(Sensors.self, from: jsondata)
                        if let tempSensor = sensorsList!.sensors.first(where: {$0.sensorType == myISSid}) {
                            let celsiusTemp = (tempSensor.data[0].temp! - 32) * 5/9
                            externalTemp=celsiusTemp
                            isConnected=true
                            connStatus="Connected"
                        } else {
                            isConnected=false
                            connStatus="No Sensors Detected"
                        }
                    } else {
                        isConnected=false
                        connStatus=String(decoding: jsondata, as: UTF8.self)
                        print("Error:",String(decoding: jsondata, as: UTF8.self))
                    }
                }
            }
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }
        .padding()
    }
}
#Preview {
    ContentView(externalTemp: .constant(0), isConnected: .constant(false))
}
