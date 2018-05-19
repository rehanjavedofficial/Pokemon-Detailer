//
//  PokemonData.swift
//  Pokemon Detailer
//
//  Created by Rehan Javed on 20/05/2018.
//  Copyright © 2018 RJ APPS. All rights reserved.
//

import Foundation

// Represents complete pokemon data..
class PokemonData {

    // Attributes
    private var _id: Int
    private var _name: String
    private var _specie_id: Int
    private var _height: Int
    private var _weight: Int
    private var _baseExperience: Int
    private var _order: Int
    private var _isDefault: Int
    
    // Initializer..
    init(id: Int, name: String, specie: Int, height: Int, weight: Int, baseExperience: Int, order: Int, isDefault: Int) {
        
        self._id = id
        self._name = name
        self._specie_id = specie
        self._height = height
        self._weight = weight
        self._baseExperience = baseExperience
        self._order = order
        self._isDefault = isDefault
        
    }
    
    // Getters...
    
    var getID: Int {
        return _id
    }
    
    var getName: String {
        return _name
    }
    
    var getSpecieID: Int {
        return _specie_id
    }
    
    var getWeight: Int {
        return _weight
    }
    
    var getHeight: Int {
        return _height
    }
    
    var getBaseExperience: Int {
        return _baseExperience
    }
    
    var getOrder: Int {
        return _order
    }
    
    var getIsDefault: Int {
        return _isDefault
    }

    // print complete data..
    func getCompletePokemonData() -> String {
        
        return "ID: \(_id), Name: \(_name), SpecieID: \(_specie_id), Weight: \(_weight), Height: \(_height), Base Experience: \(_baseExperience), Order: \(_order), isDefault: \(_isDefault)"
        
    }
    
}
