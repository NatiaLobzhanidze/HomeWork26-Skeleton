//
//  API.swift
//  HomeWork26
//
//  Created by Natia's Mac on 25/11/2021.
//

import Foundation
import UIKit

struct MovieModel: Codable{
    let image: String
    let title: String
    let review: String
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case image = "poster_path"
        case review = "overview"
        
    }
}

struct MovieResponse: Codable {
    let results: [MovieModel]
    
}
