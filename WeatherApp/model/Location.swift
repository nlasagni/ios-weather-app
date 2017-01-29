//
//  Location.swift
//  WeatherApp
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//

import CoreLocation

class Location {
    
    private var mLatitude: Double!
    private var mLongitude: Double!
    
    var latitude: Double {
        get {
            if mLatitude == nil {
                return 0.0
            }
            return mLatitude
        }
        set {
            mLatitude = newValue
        }
    }
    
    var longitude: Double {
        get {
            if mLongitude == nil {
                return 0.0
            }
            return mLongitude
        }
        set {
            mLongitude = newValue
        }
    }
    
}
