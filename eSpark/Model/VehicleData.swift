//
//  VehicleData.swift
//  eSpark
//
//  Created by Arvydas Klimavicius on 2020-10-10.
//

import Foundation

struct VehicleData: Codable {
    let plateNumber: String
    let model: Model
    let location: Location
    
}

struct Model: Codable {
    let title: String
    let photoUrl: String
}

struct Location: Codable {
    let latitude: Double
    let longitude: Double
    let address: String
}
