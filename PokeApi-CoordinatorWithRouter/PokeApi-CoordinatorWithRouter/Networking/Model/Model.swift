//
//  Model.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import Foundation

struct PokemonListResponse: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
    let url: String
}
