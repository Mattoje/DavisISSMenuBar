//
// Created by matteo on 30/12/23
// Copyright (C) 2023  Mattoje
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License version 2,
// as published by the Free Software Foundation.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program; if not, write to the Free Software Foundation, Inc.,
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


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
