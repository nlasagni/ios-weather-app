//
//  Forecast.swift
//  WeatherApp
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import UIKit

class Forecast {
    
    private var mDate: String!
    private var mWeatherType: String!
    private var mHighTemp: String!
    private var mLowTemp: String!
    
    var date: String {
        get {
            if mDate == nil {
                mDate = ""
            }
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
    
    var highTemp: String {
        get {
            if mHighTemp == nil {
                mHighTemp = ""
            }
            return mHighTemp
        }
        set {
            mHighTemp = newValue
        }
    }
    
    var lowTemp: String {
        get {
            if mLowTemp == nil {
                mLowTemp = ""
            }
            return mLowTemp
        }
        set {
            mLowTemp = newValue
        }
    }
    
}
