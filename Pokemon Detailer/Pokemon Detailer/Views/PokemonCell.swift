//
//  PokemonCell.swift
//  Pokemon Detailer
//
//  Created by Rehan Javed on 17/05/2018.
//  Copyright © 2018 RJ APPS. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {

    // UI Variables..
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    
    // Registering Cell with Pokemon Model.
    func registerPokemon(pokemon: Pokemon) {
        
        self.pokemonImage.image = UIImage(named: "\(pokemon.getPokemonID)")
        self.pokemonName.text = pokemon.getPokemonName.capitalized
        
    }
    
}
