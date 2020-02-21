//
//  File.swift
//  CoreLocationDemo
//
//  Created by Tsering Lama on 2/21/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import Foundation
import CoreLocation

class CoreLocationSession: NSObject {
    public var locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }
}

extension CoreLocationSession: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocation")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("always")
        case .authorizedWhenInUse:
            print("inUse")
        case .denied:
            print("denied")
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        default:
            print("default")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion")
    }
}
