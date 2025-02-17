//
//  LocationCell.swift
//  ImageLocationMap
//
//  Created by Rynat Shakirov on 15.02.2025.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    
    func configure(location: String) {
        label.text = location
    }

}
