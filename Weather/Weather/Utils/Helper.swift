//
//  Helper.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 24/02/23.
//

import Foundation

class Helper{
  
    //MARK: Convert Kelvin to Celsius
    class func convertKelivinToCelsius(kelvinTemp:Double) -> Double{
        return kelvinTemp - 273.15

    }
    class func getRoundedCelsiusFromKelvin(kelvinTemp:Double) -> Double{
        return round(convertKelivinToCelsius(kelvinTemp: kelvinTemp))
    }
}

