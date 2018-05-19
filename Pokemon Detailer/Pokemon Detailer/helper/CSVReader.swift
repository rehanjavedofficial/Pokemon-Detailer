//
//  CSVReader.swift
//  Pokemon Detailer
//
//  Created by Rehan Javed on 20/05/2018.
//  Copyright © 2018 RJ APPS. All rights reserved.
//

import Foundation

// CSV file reader..
class CSVReader {
    
    // Reading csv file data from pokemon.csv
    func readCSVData() -> [PokemonData] {
        
        var pokemonData: [PokemonData] = []
        
        do{ // for error...
            
            let path = Bundle.main.path(forResource: "pokemon", ofType: "csv") // pokemon file..
            let data = try String(contentsOfFile: path!, encoding: .utf8) // reading complete string..
         
            var dataRows = data.components(separatedBy: "\n") // data rows...
            
            dataRows.remove(at: 0) // removing the header..
            dataRows.removeLast() // removing the last space..
            
            var count = 0
            for row in dataRows {
                
                let rowComponents = row.components(separatedBy: ",") // row components of one row.
                
                // adding pokemon row data in array.
                pokemonData.append(PokemonData(id: Int(rowComponents[0])!, name: rowComponents[1], specie: Int(rowComponents[2])!, height: Int(rowComponents[3])!, weight: Int(rowComponents[4])!, baseExperience: Int(rowComponents[5])!, order: Int(rowComponents[6])!, isDefault: Int(rowComponents[7])!))
                count = count + 1
                
            }
            
        }catch { // if file not found..
            print("Pokemon.csv File Not exists..")
        }
        
        return pokemonData
        
    }
    
}
