//
//  NetworkWeatherManager.swift
//  WeatherJun
//
//  Created by admin1 on 10.02.2022.
//

import Foundation

struct NetworkWeatherManager {
    func fetchWeather() {
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?let=59.932477?lon=30.349088"
        guard let url = URL(string: urlString) else {return}
        
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("\(apiKey)", forHTTPHeaderField: "X-Yandex-API-key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
    }
            print(String(data: data, encoding: .utf8)!)
        }
        
        task.resume()
        
    }
}
