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
    func readCSVData() -> [Pokemon] {
        
        var pokemonData: [Pokemon] = []
        
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
                pokemonData.append(Pokemon(pokemonName: rowComponents[1], pokemonId: Int(rowComponents[0])!))
                count = count + 1
                
            }
            
        }catch { // if file not found..
            print("Pokemon.csv File Not exists..")
        }
        
        return pokemonData
        
    }
    
}
