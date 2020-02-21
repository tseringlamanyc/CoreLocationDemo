//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Tsering Lama on 2/21/20.
//  Copyright © 2020 Tsering Lama. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    private let locationSession = CoreLocationSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        convertCoordinateToPlacemark()
        placeToCoordinate()
        
        // configure map view
        mapView.showsUserLocation = true
        loadMapView()
    }
    
    func makeAnnotations() -> [MKPointAnnotation]{
        var annotations = [MKPointAnnotation]()
        for location in Location.getLocations() {
           let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = location.title
            annotations.append(annotation)
        }
        return annotations
    }
    
    private func loadMapView() {
        let annotations = makeAnnotations()
        mapView.addAnnotations(annotations)
        mapView.showAnnotations(annotations, animated: true)
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

extension MapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("didselect")
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("callout")
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else {
            return nil
        }
        let identifier = "Location Annotation"
        var annotationView: MKPinAnnotationView
        
        // deque / reuse annotation view
        if let dequeView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView {
            annotationView = dequeView
        } else {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView.canShowCallout = true
        }
        return annotationView
    }
}

// didSelectAnnotation
// didSelectView
// viewForAnnotation
// callout
