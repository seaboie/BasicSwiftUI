//
//  Location.swift
//  BasicSwiftUI
//
//  Created by Kritbovorn Taweeyossak on 28/12/2564 BE.
//

import Foundation
import CoreLocation

struct Location: Identifiable, Equatable {
    
//    let id = UUID().uuidString
    
    var id: String {
        // logic for create 'id' from name, cityName
        name + cityName
    }
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        
        lhs.id == rhs.id
    }
}
