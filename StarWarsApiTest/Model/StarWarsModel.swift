//
//  Character.swift
//  StarWarsApiTest
//
//  Created by Gleb Sobolevsky on 08.04.2022.
//

import Foundation
import UIKit

struct Characters: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Character]
}

struct Character: Codable {
    let name: String
    let height: String
    let mass: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: [String]
    let vehicles: [String]
    let starships: [String]
    let created: String
    let edited: String
    let url: String
}

struct Planet: Codable {
    let name: String
    let rotation_period: String
    let orbital_period: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surface_water: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
}

struct APIError: Codable {
    let message: String
}

