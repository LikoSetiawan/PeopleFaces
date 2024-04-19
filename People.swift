//
//  People.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 18/04/24.
//

import Foundation


struct People: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var image: Data
    
    #if DEBUG
    static let example = People(id: UUID(), name: "titit12", image: Data("Joji".utf8))
    #endif
}
