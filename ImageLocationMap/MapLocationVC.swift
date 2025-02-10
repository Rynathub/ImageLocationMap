//
//  MapLocationVC.swift
//  ImageLocationMap
//
//  Created by Rynat Shakirov on 10.02.2025.
//

import UIKit

class MapLocationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UserLocationManager.shared.requestLocationPermission()
    }
    


}
