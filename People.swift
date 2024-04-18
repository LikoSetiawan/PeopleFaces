//
//  People.swift
//  PeopleFaces
//
//  Created by Liko Setiawan on 18/04/24.
//

import Foundation


struct People: Codable, Hashable {
    var name: String
    var image: Data
    
    static let example = People(name: "titit12", image: Data("sampleImageData".utf8))
}
