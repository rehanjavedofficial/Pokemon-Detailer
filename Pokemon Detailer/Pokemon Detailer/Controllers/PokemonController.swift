//
//  ViewController.swift
//  Pokemon Detailer
//
//  Created by Rehan Javed on 16/05/2018.
//  Copyright © 2018 RJ APPS. All rights reserved.
//

import UIKit
import AVKit

class PokemonController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    // Attributes..
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    private var pokemonData: [Pokemon] = []
    private var filteredPokemonData: [Pokemon] = []
    private var buttonClick: AVAudioPlayer!
    private var searchedData: Bool = false
    
    // When view in complete.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.searchBar.delegate = self
        
        self.searchBar.returnKeyType = UIReturnKeyType.done
        self.pokemonData = CSVReader().readCSVData() // reading the data from csv file..
        
        initClickSound()
        
    }
    
    // initializing sound..
    func initClickSound(){
        
        do{
           
            let path = Bundle.main.path(forResource: "buttonpressed", ofType: "mp3")!
            let encoded = path.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
            buttonClick = try AVAudioPlayer(contentsOf: URL(string: encoded)!)
            buttonClick.prepareToPlay()
            buttonClick.numberOfLoops = 1
            
        }catch {
            print("Error occured while initializing Sound..")
        }
        
        
    }

    ////////////////////////////////
    // UICollectionView methods..
    ///////////////////////////////
    
    // number of pokemons..
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if searchedData {
            
            return filteredPokemonData.count
            
        } else {
            
            return pokemonData.count
            
        }
        
    }
    
    // cell in the section.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemoncell", for: indexPath) as? PokemonCell {
            
            if searchedData {
                cell.registerPokemon(pokemon: self.filteredPokemonData[indexPath.row])
            } else {
                cell.registerPokemon(pokemon: self.pokemonData[indexPath.row])
            }
            
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
        
        self.buttonClick.play()
    
        if searchedData {
            
            print("\(self.filteredPokemonData[indexPath.row].getPokemonName), \(self.filteredPokemonData[indexPath.row].getPokemonID)")
            
        }else {
            
            print("\(self.pokemonData[indexPath.row].getPokemonName), \(self.pokemonData[indexPath.row].getPokemonID)")
            
        }
    
    }
    
    // the size of each pokemon cell.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 115, height: 130)
    
    }
    
    ///////////////
    // Search Bar
    ///////////////
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            
            searchedData = false
            searchBar.endEditing(true)
            collectionView.reloadData()
            
        }else{
        
            let searchedText = searchText.lowercased()
            searchedData = true
            filteredPokemonData = pokemonData.filter({$0.getPokemonName.range(of: searchedText) != nil})
            collectionView.reloadData()
            
        }
        
    }
    
    // When done button is clicked on keyboard to close it.
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        searchBar.endEditing(true)
        
    }
    
    // when cancel button is pressed in Search Bar.
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        searchedData = false
        searchBar.text = ""
        collectionView.reloadData()
        
    }
    
}

