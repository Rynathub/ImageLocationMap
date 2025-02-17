//
//  LocationSearchController.swift
//  ImageLocationMap
//
//  Created by Rynat Shakirov on 14.02.2025.
//

import Foundation
import UIKit
import MapKit

class LocationSearchController:UITableViewController,UISearchResultsUpdating {
    var matches : [MKMapItem] = []
    var mapView : MKMapView? = nil
    var callBack : ((CLLocation,String) -> ())?
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let mapView = mapView, let searchBarText = searchController.searchBar.text else {
            return
        }
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response else {
                return
            }
            self.matches = response.mapItems
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.matches.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") else {
            fatalError()
        }
        let selectedCell = matches[indexPath.row].placemark
        cell.textLabel?.text = selectedCell.name
        let address = "\(selectedCell.thoroughfare ?? ""), \(selectedCell.locality ?? ""), \(selectedCell.subLocality ?? ""), \(selectedCell.administrativeArea ?? ""), \(selectedCell.country ?? ""), \(selectedCell.postalCode ?? "")"
        cell.detailTextLabel?.text = address
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = matches[indexPath.row].placemark
        callBack?(selectedCell.location!,selectedCell.name!)
        self.dismiss(animated: true,completion: nil)
            
        
    }
    
}
