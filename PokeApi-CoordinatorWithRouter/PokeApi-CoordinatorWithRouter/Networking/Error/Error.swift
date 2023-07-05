//
//  Error.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import Foundation

enum APIError: Error {
    case genericError(Error)
    case invalidURL
    case decodingError
    case noData
}
