//
//  SearchViewModel_Tests.swift
//  WeatherTests
//
//  Created by Soniya Vishwakarma on 24/02/23.
//

import XCTest
@testable import Weather

final class SearchViewModel_Tests: XCTestCase {

    let vm = SearchViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_SearchViewModel_wetherData_shouldNotEmpty() {
        
        vm.getWeatherData { weatherData in
            XCTAssertNotNil(weatherData, "WeatherData is nil")
            XCTAssertFalse(weatherData?.isEmpty ?? true, "WeatherData is empty")
        }
    }

    func test_SearchViewModel_filterFromData_shouldNotEmpty() {
        
        let cityName = "pune"
        
        vm.getWeatherData { weatherData in
            let filteredWeatherData: WeatherData? = self.vm.filterFromData(cityDetails: cityName)
            
            XCTAssertNotNil(filteredWeatherData, "Filtered weatherData is nil")
            XCTAssertFalse(filteredWeatherData?.isEmpty ?? true, "Filtered weatherData is empty")
        }
    }
    
    func test_SearchViewModel_filterFromData_getEmpty() {
        
        let cityName = "pune"
        let filteredWeatherData: WeatherData? = self.vm.filterFromData(cityDetails: cityName)
        
        XCTAssertNil(filteredWeatherData, "Filtered weatherData is not nil")
        XCTAssertTrue(filteredWeatherData?.isEmpty ?? true, "Filtered weatherData is not empty")
    }
}
