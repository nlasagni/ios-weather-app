//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Nicola Lasagni on 20/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit

class CurrentWeather {
    
    private var mCityName: String!
    private var mDate: String!
    private var mWeatherType: String!
    private var mCurrentTemp: String!
    
    var cityName: String {
        get {
            if mCityName == nil {
                mCityName = ""
            }
            return mCityName
        }
        set {
            mCityName = newValue
        }
    }
    
    var date: String {
        get {
            if mDate == nil {
                mDate = ""
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: Date())
            mDate = "Today, \(currentDate)"
            return mDate
        }
        set {
            mDate = newValue
        }
    }
    
    var weatherType: String {
        get {
            if mWeatherType == nil {
                mWeatherType = ""
            }
            return mWeatherType
        }
        set {
            mWeatherType = newValue
        }
    }
    
    var currentTemp: String {
        get {
            if mCurrentTemp == nil {
                mCurrentTemp = ""
            }
            return mCurrentTemp
        }
        set {
            mCurrentTemp = newValue
        }
    }
    
}
