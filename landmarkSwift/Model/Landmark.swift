//
//  Landmark.swift
//  PSTest
//
//  Created by PrinceSmall on 2019/7/4.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

import SwiftUI

import CoreLocation
/*
 "name": "Charley Rivers",
 "category": "Rivers",
 "city": "Eaking",
 "state": "Alaska",
 "id": 1007,
 "park": "Charley Rivers National Preserve",
 "coordinates": {
 "longitude": -143.122586,
 "latitude": 65.350021
 },
 "imageName": "charleyrivers",
 */
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var state: String
    var park: String
    var category: Category
    var isFavorite: Bool
    
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    func image(forSize size: Int) -> Image {
        ImageStore.shared.image(name: imageName, size: size)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case mountains = "Mountains"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
