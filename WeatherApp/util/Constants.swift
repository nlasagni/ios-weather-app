//
//  Constants.swift
//  WeatherApp
//
//  Created by Nicola Lasagni on 20/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import Foundation

let CURRENT_WEATHER_BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let FORECAST_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let UNIT = "&units="
let COUNT = "&cnt="
let MODE = "&mode="
let APP_ID = "&appid="
let API_KEY = "45dd981d2adec8c979f79bf7d3dc1ee8"

let CURRENT_WEATHER_URL = "\(CURRENT_WEATHER_BASE_URL)\(LATITUDE)%@\(LONGITUDE)%@\(UNIT)metric\(APP_ID)\(API_KEY)"
let FORECAST_URL = "\(FORECAST_BASE_URL)\(LATITUDE)%@\(LONGITUDE)%@\(UNIT)metric\(COUNT)10\(MODE)json\(APP_ID)\(API_KEY)"
