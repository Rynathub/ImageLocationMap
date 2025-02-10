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
    
    private override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
    }
}
