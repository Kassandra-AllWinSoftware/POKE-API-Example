//
//  PokemonItemCollectionViewCell.swift
//  PokeApi-CoordinatorWithRouter
//
//  Created by Kassandra Zuniga on 7/4/23.
//

import UIKit

final class PokemonItemCollectionViewCell: UICollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet private var itemName: UILabel!
    
    func configure(itemName: String) {
        self.itemName.text = itemName
    }
}
