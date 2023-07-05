//
//  APIRepresentable.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import Foundation

protocol APIRepresentable {
    func loadData(completion: @escaping(Result<[Pokemon],APIError>) -> Void)
}
