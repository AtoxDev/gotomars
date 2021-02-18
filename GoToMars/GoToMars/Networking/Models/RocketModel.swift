//
//  File.swift
//  GoToMars
//
//  Created by Jorge Tapia on 17/2/21.
//

import Foundation

struct RocketModel: Decodable {
    
    let images: [String]?
    let name: String?
    let information: String?
    
    enum CodingKeys: String, CodingKey {
        case images = "flickr_images"
        case name
        case information = "description"
    }
    
}
