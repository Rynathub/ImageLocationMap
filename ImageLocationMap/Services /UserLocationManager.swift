//
//  UserLocationManager.swift
//  ImageLocationMap
//
//  Created by Rynat Shakirov on 10.02.2025.
//

import Foundation
import CoreLocation

class UserLocationManager:NSObject, CLLocationManagerDelegate {
    
    
    static let shared = UserLocationManager()
    private var locationManager: CLLocationManager?
    
    private var currentLocation: CLLocation?
    
    private override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.distanceFilter = 10
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    func requestLocationPermission() {
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
                case .notDetermined:
                    print("When user did not yet determined")
                case .restricted:
                    print("Restricted by parental control")
                case .denied:
                    print("When user select option Dont't Allow")
                // 1
                case .authorizedAlways:
                    print("When user select option Change to Always Allow")
                    locationManager?.startUpdatingLocation()
                case .authorizedWhenInUse:
                    print("When user select option Allow While Using App or Allow Once")
                    // 2
                    locationManager?.startUpdatingLocation()
                default:
                    print("default")
                }
    }
    func getLocation() -> CLLocation? {
        if let currentLocation {
            return currentLocation
        } else {
            print("Something went wrong")
        }
        return nil
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        
        currentLocation = latestLocation
    }
}
