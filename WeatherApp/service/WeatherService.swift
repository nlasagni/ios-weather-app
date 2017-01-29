//
//  CurrentWeatherApi.swift
//  WeatherApp
//
//  Created by Nicola Lasagni on 20/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import Foundation
import Alamofire

class WeatherService {
    
    private var locationService: LocationService!
    
    init() {
        locationService = LocationService()
        locationService.loacationAuthstatus()
    }
    
    func downloadWeatherDetails(completion: @escaping (_ currentWeather: CurrentWeather) -> Void) {
        let location = locationService.currentLocation
        let urlString = String(format: CURRENT_WEATHER_URL, "\(location.latitude)", "\(location.longitude)")
        print("WeatherService downloadWeatherDetails: \(location.latitude)")
        print("WeatherService downloadWeatherDetails: \(location.longitude)")
        print("WeatherService downloadWeatherDetails: \(urlString)")
        let currentWeatherUrl = URL(string: urlString)!
        Alamofire.request(currentWeatherUrl).responseJSON { response in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                let currentWeather = CurrentWeather()
                if let name = dictionary["name"] as? String {
                    currentWeather.cityName = name.capitalized
                }
                if let weather = dictionary["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        currentWeather.weatherType = main.capitalized
                    }
                }
                if let main = dictionary["main"] as? Dictionary<String, AnyObject> {
                    if let currentTemp = main["temp"] as? Double {
                        currentWeather.currentTemp = "\(currentTemp)"
                    }
                }
                completion(currentWeather)
            }
        }
    }
    
    func downloadForecast(completion: @escaping (_ forecastArray: [Forecast]) -> Void) {
        let location = locationService.currentLocation
        let urlString = String(format: FORECAST_URL, "\(location.latitude)", "\(location.longitude)")
        print("WeatherService downloadForecast: \(location.latitude)")
        print("WeatherService downloadForecast: \(location.longitude)")
        print("WeatherService downloadForecast: \(urlString)")
        let forecastUrl = URL(string: urlString)!
        Alamofire.request(forecastUrl).responseJSON { response in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                var forecastArray = [Forecast]()
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                    for forecastDict in list {
                        let forecast = Forecast()
                        if let temp = forecastDict["temp"] as? Dictionary<String, AnyObject> {
                            if let max = temp["max"] as? Double {
                                forecast.highTemp = "\(max)"
                            }
                            if let min = temp["min"] as? Double {
                                forecast.lowTemp = "\(min)"
                            }
                        }
                        if let weather = forecastDict["weather"] as? [Dictionary<String, AnyObject>] {
                            if let main = weather[0]["main"] as? String {
                                forecast.weatherType = main
                            }
                        }
                        if let date = forecastDict["dt"] as? Double {
                            let unixConvertedDate = Date(timeIntervalSince1970: date)
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .full
                            dateFormatter.dateFormat = "EEEE"
                            dateFormatter.timeStyle = .none
                            forecast.date = unixConvertedDate.dayOfWeek()
                            
                        }
                        forecastArray.append(forecast)
                    }
                }
                if forecastArray.count > 0 {
                    forecastArray.remove(at: 0)
                }
                completion(forecastArray)
            }
        }
    }
    
}
