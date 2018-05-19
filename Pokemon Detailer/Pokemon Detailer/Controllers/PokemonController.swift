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
    private var pokemonData: [Pokemon] = []
    
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
    
    // number of pokemons..
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonData.count
    }
    
    // cell in the section.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemoncell", for: indexPath) as? PokemonCell {
            
            cell.registerPokemon(pokemon: self.pokemonData[indexPath.row])
            return cell
            
        }else{
            return UICollectionViewCell()
        }
        
    }
    
    // number of sections..
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    // when any cell is clicked..
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(self.pokemonData[indexPath.row].getPokemonName), \(self.pokemonData[indexPath.row].getPokemonID)")
    }
    
    // the size of each pokemon cell.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 115, height: 130)
    }
    
}

