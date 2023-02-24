//
//  SearchViewModel.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 22/02/23.
//

import Combine
import Foundation

class SearchViewModel {
    private var weatherData: WeatherData?

    init() {
    }

    func getWeatherData(result: @escaping (_ data: WeatherData?) -> Void) {
        DispatchQueue.main.async {
            self.weatherData = self.populateWeatherData()
            result(self.weatherData)
        }
    }

    private func populateWeatherData() -> WeatherData? {
        if let filepath = Bundle.main.path(forResource: "weather_14", ofType: "json") {
            do {
                let strData = try String(contentsOfFile: filepath)
                guard let dataConverted = strData.data(using: .utf8) else { return nil }
                let contents = try JSONDecoder().decode(WeatherData.self, from: dataConverted)
                return contents
            } catch {
                print("Error: \(error)")
            }
        }
        return nil
    }

    func filterFromData(cityDetails: String) -> WeatherData? {
        let filteredWeatherData = weatherData?.filter { ($0.city?.findname!)!.contains(cityDetails.uppercased()) }
        if let filterData = filteredWeatherData {
            return filterData
        }
//        if let cityName = weatherData?.first {
//            return cityName
//        }
        return nil
    }
}
