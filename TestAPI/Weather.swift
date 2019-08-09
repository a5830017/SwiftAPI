//
//  MarvelStruct.swift
//  TestAPI
//
//  Created by Jiratip Hemwutthipan on 9/8/2562 BE.
//  Copyright © 2562 ggez. All rights reserved.
//

import Foundation

struct CurrentWeather: Codable { // Codable = Encodable + Decodable
    let coord: coord
    let sys: sys
    let weather : [weather]
    
//    private enum CodingKeys: String, CodingKey {
//        case coord
//        case sys
//    }
}

struct coord : Codable {
    let lon: Double
    let lat: Double
}

struct sys: Codable {
    let message: Double
    let country: String
    
    
}

struct weather : Codable {
    let id :Int
    let main :String
    
}
