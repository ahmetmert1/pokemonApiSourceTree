//
//  ApiPokemontoListing.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 2.08.2022.
//

import Foundation

struct Pokemon : Codable {
    var next : String
    var results : [PokemonEntry]
}

struct PokemonEntry : Codable, Identifiable {
    let id = UUID()
    var name : String
    var url : String
}



class PokemonApitoListing : ObservableObject {
    
    
    @Published var data = [PokemonEntry]()
    @Published var offset = 0
    
    init(){

        updateData()

    }
    func updateData(){
        
      let url = "https://pokeapi.co/api/v2/pokemon?offset=\(offset)&limit=20"
        
        
    let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!){ (data,response,err) in
            
            
            if (err != nil){
                print(err?.localizedDescription)
                return
            }
            
            do{
                let jsonVerisi = try JSONDecoder().decode(Pokemon.self, from: data!)
                
                if let httpResponse = response as? HTTPURLResponse {
                        print("statusCode: \(httpResponse.statusCode)")
                    
                    }
                
                let oldData = self.data
                
                DispatchQueue.main.async {
                    self.data = oldData + jsonVerisi.results
                    
                    self.offset += 20
                }
                
                
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
