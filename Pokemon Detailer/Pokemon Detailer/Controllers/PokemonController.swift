//
//  ViewController.swift
//  Pokemon Detailer
//
//  Created by Rehan Javed on 16/05/2018.
//  Copyright © 2018 RJ APPS. All rights reserved.
//

import UIKit

class PokemonController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // Attributes..
    @IBOutlet weak var collectionView: UICollectionView!
    private var pokemonData: [PokemonData] = []
    
    // When view in complete.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.pokemonData = CSVReader().readCSVData() // reading the data from csv file..
        
    }

    ////////////////////////////////
    // UICollectionView methods..
    ///////////////////////////////
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemoncell", for: indexPath) as? PokemonCell {
            
            let pokData: PokemonData = self.pokemonData[indexPath.row]
            cell.registerPokemon(pokemon: Pokemon(pokemonName: pokData.getName, pokemonId: pokData.getID))
            
            return cell
            
        }else{
            return UICollectionViewCell()
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(self.pokemonData[indexPath.row].getCompletePokemonData())")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 130)
    }
    
}

