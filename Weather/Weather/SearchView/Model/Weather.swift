import Foundation

// MARK: - WelcomeElement

struct WeatherElement: Codable {
    let city: City?
    let time: Int?
    let main: MainClass?
    let wind: Wind?
    let clouds: Clouds?
    let weather: [Weather]?
    let rain: Rain?
}

// MARK: - City

struct City: Codable {
    let id: Int?
    let name, findname, country: String?
    let coord: Coord?
    let zoom: Int?
    let langs: [[String: String]]?
}

// MARK: - Coord

struct Coord: Codable {
    let lon, lat: Double?
}

// MARK: - Clouds

struct Clouds: Codable {
    let all: Int?
}

// MARK: - MainClass

struct MainClass: Codable {
    let temp, pressure: Double?
    let humidity: Int?
    let tempMin, tempMax, seaLevel, grndLevel: Double?

    enum CodingKeys: String, CodingKey {
        case temp, pressure, humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Rain

struct Rain: Codable {
    let the3H: Double?
    let the1H: Int?

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
        case the1H = "1h"
    }
}

// MARK: - Weather

struct Weather: Codable {
    let id: Int?
    let main: String?
    let description:String?
    let icon:String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }
}


// MARK: - Weather

//struct Weather: Codable {
//    let id: Int?
//    @NilOnFail var main: MainEnum?
//    @NilOnFail var description: Description?
//    @NilOnFail var icon: Icon?
//}
//
//enum Description: String, Codable {
//    case brokenClouds = "broken clouds"
//    case descriptionSkyIsClear = "sky is clear"
//    case drizzle
//    case dust
//    case fewClouds = "few clouds"
//    case fog
//    case freezingRain = "freezing rain"
//    case haze
//    case heavyIntensityRain = "heavy intensity rain"
//    case heavySnow = "heavy snow"
//    case lightIntensityDrizzle = "light intensity drizzle"
//    case lightIntensityShowerRain = "light intensity shower rain"
//    case lightRain = "light rain"
//    case lightShowerSleet = "light shower sleet"
//    case lightShowerSnow = "light shower snow"
//    case lightSnow = "light snow"
//    case lightThunderstorm = "light thunderstorm"
//    case mist
//    case moderateRain = "moderate rain"
//    case overcastClouds = "overcast clouds"
//    case proximityModerateRain = "proximity moderate rain"
//    case proximityShowerRain = "proximity shower rain"
//    case proximityThunderstorm = "proximity thunderstorm"
//    case rainAndDrizzle = "rain and drizzle"
//    case sand
//    case scatteredClouds = "scattered clouds"
//    case skyIsClear = "Sky is Clear"
//    case smoke
//    case snow
//    case thunderstorm
//    case thunderstormWithLightRain = "thunderstorm with light rain"
//    case thunderstormWithRain = "thunderstorm with rain"
//}
//
//enum Icon: String, Codable {
//    case the01D = "01d"
//    case the01N = "01n"
//    case the02D = "02d"
//    case the02N = "02n"
//    case the03D = "03d"
//    case the03N = "03n"
//    case the04D = "04d"
//    case the04N = "04n"
//    case the09D = "09d"
//    case the09N = "09n"
//    case the10D = "10d"
//    case the10N = "10n"
//    case the11D = "11d"
//    case the11N = "11n"
//    case the13D = "13d"
//    case the13N = "13n"
//    case the50D = "50d"
//    case the50N = "50n"
//}
//
//enum MainEnum: String, Codable {
//    case clear = "Clear"
//    case clouds = "Clouds"
//    case drizzle = "Drizzle"
//    case dust = "Dust"
//    case fog = "Fog"
//    case haze = "Haze"
//    case mist = "Mist"
//    case rain = "Rain"
//    case sand = "Sand"
//    case smoke = "Smoke"
//    case snow = "Snow"
//    case thunderstorm = "Thunderstorm"
//}
//
// MARK: - Wind

struct Wind: Codable {
    let speed, deg: Double?
    let varBeg, varEnd: Int?
    let gust: Double?

    enum CodingKeys: String, CodingKey {
        case speed, deg
        case varBeg = "var_beg"
        case varEnd = "var_end"
        case gust
    }
}

typealias WeatherData = [WeatherElement]
@propertyWrapper public struct NilOnFail<T: Codable>: Codable {
    public let wrappedValue: T?
    public init(from decoder: Decoder) throws {
        wrappedValue = try? T(from: decoder)
    }

    public init(_ wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }
}
