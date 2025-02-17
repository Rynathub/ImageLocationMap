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
    
    var resultSearchController: UISearchController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserLocationManager.shared.requestLocationPermission()
        
        let locationSearchController = storyboard?.instantiateViewController(withIdentifier: "LocationSearchController") as! LocationSearchController
        locationSearchController.callBack = { location,name in
            MapService.shared.updateLocationOnMap(location: location,mapView: self.mapView,with:name)
            
        }
        resultSearchController = UISearchController(searchResultsController: locationSearchController)
        resultSearchController?.searchResultsUpdater = locationSearchController as any UISearchResultsUpdating
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.searchController = resultSearchController
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        locationSearchController.mapView = self.mapView
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
