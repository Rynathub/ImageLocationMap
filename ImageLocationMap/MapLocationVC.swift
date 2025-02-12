//
//  MapLocationVC.swift
//  ImageLocationMap
//
//  Created by Rynat Shakirov on 10.02.2025.
//

import UIKit
import MapKit

class MapLocationVC: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserLocationManager.shared.requestLocationPermission()
    }
    

    func updateLocation(location: CLLocation) {
        DispatchQueue.main.async {
            MapService.shared.updateLocationOnMap(location: location, mapView: self.mapView, with: "Test location")
        }
    }
    @IBAction func updateLocationButtonTapped(_ sender: UIButton) {
        guard let location = UserLocationManager.shared.getLocation() else {
            return
        }
        updateLocation(location: location)
    }
    
}
