//
//  MapService.swift
//  ImageLocationMap
//
//  Created by Rynat Shakirov on 11.02.2025.
//

import Foundation
import MapKit


class MapService {
    static let shared = MapService()
    private init() {}
    
   func updateLocationOnMap(location: CLLocation,mapView: MKMapView,with title:String?) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = location.coordinate
        annotation.title = title
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        mapView.setRegion(region, animated: true)
    }
}
