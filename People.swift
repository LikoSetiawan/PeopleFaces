//
//  People.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 18/04/24.
//

import Foundation
import MapKit


struct People: Codable, Hashable, Identifiable, Equatable, Comparable {
    var id: UUID
    var name: String
    var image: Data
    var latitude: Double
    var longitude: Double
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    #if DEBUG
    static let example = People(id: UUID(), name: "titit12", image: Data("Joji".utf8), latitude: 0.0, longitude: 0.0)
    #endif
    
    static func < (lhs: People, rhs: People) -> Bool {
            lhs.name < rhs.name
        }
}
