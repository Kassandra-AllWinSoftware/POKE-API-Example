//
//  MainListViewController.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import UIKit

final class MainListViewController: UIViewController, UICollectionViewDelegate {
// MARK: - IBOutlets
    @IBOutlet private var collectionView: UICollectionView!
    
    var pokemonAPI = PokemonAPI()
    var pokemonName: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        fetchPokemonList()
        
        collectionView.register(UINib(nibName: "PokemonItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellName")
    }
    
    //MARK: - Fetch to API
    func fetchPokemonList() {
        pokemonAPI.loadData { [unowned self] result in
            switch result {
            case .success(let pokemonList):
                self.pokemonName = pokemonList.map { $0.name }
                reloadCollectionView()
            case .failure(let error):
                print("Error fetching Pokemon list: \(error)")
            }
        }
    }
    
    private func reloadCollectionView() {
        DispatchQueue.main.async { [unowned self] in
            collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MainListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pokemonName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellName", for: indexPath) as! PokemonItemCollectionViewCell
        let pokemonNameCurrent = pokemonName[indexPath.item]
        cell.configure(itemName: pokemonNameCurrent)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MainListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let cellWidth = screenWidth

        return CGSize(width: cellWidth, height: 50)
    }
}


 
