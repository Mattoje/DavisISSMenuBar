//
// Created by matteo on 30/12/23
//

import SwiftUI

struct MenuBarView: View {
    var externalTemp:Double
    var isConnected:Bool
    var body: some View {
        HStack(alignment: .center){
            if isConnected==true{
                Text("\(externalTemp, specifier: "%.1f")°")
            } else{
                Image(systemName: "thermometer.medium.slash").resizable()
            }
            
        }
    }
}

#Preview {
    MenuBarView(externalTemp: 0, isConnected: true)
}
#Preview {
    MenuBarView(externalTemp: 0, isConnected: false)
}
