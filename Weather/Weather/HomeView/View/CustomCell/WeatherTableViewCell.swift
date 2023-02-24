//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Soniya Vishwakarma on 21/02/23.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    @IBOutlet private weak var lblTemperature: UILabel!
    @IBOutlet private weak var lblTemperatureRange: UILabel!
    @IBOutlet private weak var lblCity: UILabel!

    @IBOutlet private weak var lblWeatherType: UILabel!

    @IBOutlet private weak var imgWeatherType: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(item: WeatherElement) {
        lblTemperature.text = "\(Helper.getRoundedCelsiusFromKelvin(kelvinTemp: item.main?.temp ?? 0))°"
        lblCity.text = item.city?.name
        let weather = item.weather ?? []
        if weather.count > 0{
           let mainWeather = weather[0]
            lblWeatherType.text = mainWeather.main ?? ""
        }
        lblTemperatureRange.text = "H: \(Helper.getRoundedCelsiusFromKelvin(kelvinTemp: item.main?.tempMin ?? 0))° L: \(Helper.getRoundedCelsiusFromKelvin(kelvinTemp:item.main?.tempMax ?? 0))°"
    }
}
