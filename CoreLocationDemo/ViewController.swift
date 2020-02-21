//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Tsering Lama on 2/21/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let locationSession = CoreLocationSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertCoordinateToPlacemark()
        placeToCoordinate()
    }
    
    private func convertCoordinateToPlacemark() {
        if let location = Location.getLocations().first {
            locationSession.coordinateToPlacemark(coordinate: location.coordinate)
        }
    }
    
    private func placeToCoordinate() {
        locationSession.placemarkToCoordinate(address: "Kathmandu")
    }
}

