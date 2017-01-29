//
//  LocationService.swift
//  WeatherApp
//
//  Created by Nicola Lasagni on 21/01/2017.
//  Copyright © 2017 Nicola Lasagni. All rights reserved.
//
import UIKit
import CoreLocation

class LocationService {
    
    private var mLocationManager = CLLocationManager()
    private var mCurrentLocation = Location()
    var currentLocation: Location {
        get {
            return mCurrentLocation
        }
        set {
            mCurrentLocation = newValue
        }
    }
    
    init() {
        mCurrentLocation = Location()
        mLocationManager = CLLocationManager()
        mLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        mLocationManager.requestWhenInUseAuthorization()
        mLocationManager.startMonitoringSignificantLocationChanges()
    }
    
    func loacationAuthstatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            let location = Location()
            location.latitude = (mLocationManager.location?.coordinate.latitude)!
            location.longitude = (mLocationManager.location?.coordinate.longitude)!
            print("LocationService: \(location.latitude)")
            print("LocationService: \(location.longitude)")
            currentLocation = location
        } else {
            mLocationManager.requestWhenInUseAuthorization()
            loacationAuthstatus()
        }
    }
    
}
