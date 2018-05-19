//
//  Pokemon.swift
//  Pokemon Detailer
//
//  Created by Rehan Javed on 17/05/2018.
//  Copyright © 2018 RJ APPS. All rights reserved.
//

// Pokemon class only for UICollectionViewCell usage..
class Pokemon {

    // Attributes
    private var _pokemonName : String
    private var _pokemonId : Int
    
    // Constructor..
    init(pokemonName: String, pokemonId: Int) {
        
        self._pokemonId = pokemonId;
        self._pokemonName = pokemonName
        
    }
    
    // Getters..
    var getPokemonName : String {
        return self._pokemonName
    }
    
    var getPokemonID : Int {
        return self._pokemonId
    }
    
}
