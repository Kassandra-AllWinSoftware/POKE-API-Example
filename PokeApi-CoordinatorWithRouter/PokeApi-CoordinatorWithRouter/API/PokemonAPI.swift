//
//  PokemonAPI.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import Foundation

final class PokemonAPI { }

extension PokemonAPI: APIRepresentable {
    func loadData(completion: @escaping (Result<[Pokemon], APIError>) -> Void) {

        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=60&offset=0") else {
            return completion(.failure(.invalidURL))
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                return completion(.failure(.genericError(error)))
            }
            guard let data = data else {
                return completion(.failure(.noData))
            }
            guard let pokemonList = try? JSONDecoder().decode(PokemonListResponse.self, from: data) else {
                return completion(.failure(.decodingError))

            }
            completion(.success(pokemonList.results))
        }
        .resume()
    }
}

