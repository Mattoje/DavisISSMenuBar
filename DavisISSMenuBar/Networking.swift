//
// Created by matteo on 02/01/24
//

import Foundation

func getDataFromMyWeatherlink(_ stationId: String,_ stationApiKey:String,_ stationApiSecret:String) async -> (responseJson: Data,status: Bool) {
    let url = URL(string: "https://api.weatherlink.com/v2/current/\(stationId)?api-key=\(stationApiKey)")!
    var request = URLRequest(url: url)
    request.setValue(stationApiSecret,forHTTPHeaderField:"X-Api-Secret")
    do {
        let (data,response) = try await URLSession.shared.data(for: request)
        guard let response = response as? HTTPURLResponse else {
            print("Guard response fallita", response)
            return (Data("Guard response fallita".utf8),false)
        }
        if response.statusCode==401 {
            print("error 401")
            print("response",response)
            return (Data("Error 401".utf8),false)
        }
        if response.statusCode==404 {
            print("error 404")
            print("response",response)
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
