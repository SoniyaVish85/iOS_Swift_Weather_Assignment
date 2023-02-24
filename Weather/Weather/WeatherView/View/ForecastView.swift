//
//  ForecastView.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 22/02/23.
//

import UIKit

class ForecastView: UIView {
    private var weatherDetails: WeatherElement!
    @IBOutlet private weak var imgWeatherForecast: UIImageView!

    @IBOutlet private weak var lblCloud: UILabel!
    @IBOutlet private weak var lblForecastDescription: UILabel!

    @IBOutlet private weak var lblLatLongDetails: UILabel!
    @IBOutlet private weak var lblTemperature: UILabel!
    @IBOutlet private weak var lblMinTemp: UILabel!
    @IBOutlet private weak var lblMaxTemp: UILabel!

    @IBOutlet private weak var lblWind: UILabel!

    @IBOutlet private weak var lblPressure: UILabel!

    @IBOutlet private weak var lblHumidity: UILabel!

    class func instanceFromNib() -> ForecastView {
        let view = UINib(nibName: "ForecastView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ForecastView

        return view
    }

    func fillData(details: WeatherElement) {
        weatherDetails = details
        lblTemperature.text = "\(Helper.getRoundedCelsiusFromKelvin(kelvinTemp: weatherDetails.main?.temp ?? 0))°"
        lblWind.text = "\(weatherDetails.wind?.speed ?? 0)m/s"
        lblHumidity.text = "\(weatherDetails.main?.humidity ?? 0)%"
        lblPressure.text = "\(weatherDetails.wind?.speed ?? 0) hPa"
        lblCloud.text = "\(weatherDetails.clouds?.all ?? 0)%"
        lblMaxTemp.text = "\(Helper.getRoundedCelsiusFromKelvin(kelvinTemp:weatherDetails.main?.tempMin ?? 0))°"
        lblMinTemp.text = "\(Helper.getRoundedCelsiusFromKelvin(kelvinTemp:weatherDetails.main?.tempMax ?? 0))°"
        lblLatLongDetails.text = "Lat: \(weatherDetails.city?.coord?.lat ?? 0), Long: \(weatherDetails.city?.coord?.lat ?? 0)"
        
        let weather = weatherDetails.weather ?? []
        if weather.count > 0{
           let mainWeather = weather[0]
            lblForecastDescription.text = mainWeather.description ?? ""
        }
        
        

    }

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
         // Drawing code
     }
     */
}
