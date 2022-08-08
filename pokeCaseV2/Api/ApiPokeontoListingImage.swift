////
////  ApiPokeontoListingImage.swift
////  newPokemon
////
////  Created by Ahmet Mert ÖZ on 4.08.2022.
////
//
//import Foundation
//
//struct PokemonSelectedListImage: Codable {
//    var sprites : PokemonSpritesListImage
//    var weight : Int
//}
//
//struct PokemonSpritesListImage : Codable {
//    var front_default: String?
//
//}
//
////ApiPokemonSelectedImageClass
//class ApiPokemonSelectedImageClass : ObservableObject {
//
//
//    @Published var dataImages = [PokemonSelectedListImage]()
//    @Published var offsetImage = 0
//
//
//    init(){
//
//        updateDataListImages()
//
//    }
//    func updateDataListImages(){
//
//      let url = "https://pokeapi.co/api/v2/pokemon-form/\(offsetImage)/"
//
//
//    let session = URLSession(configuration: .default)
//
//        session.dataTask(with: URL(string: url)!){ (data,response,err) in
//
//
//            if (err != nil){
//                print(err?.localizedDescription)
//                return
//            }
//
//            do{
//                let jsonVerisi = try JSONDecoder().decode(Pokemon.self, from: data!)
//
//                if let httpResponse = response as? HTTPURLResponse {
//                        print("statusCode: \(httpResponse.statusCode)")
//
//                    }
//
//                let oldData = self.data
//
//                DispatchQueue.main.async {
//                    self.data = oldData + jsonVerisi.results
//
//                    self.offset += 20
//                }
//
//
//            }catch{
//                print(error.localizedDescription)
//            }
//
//        }.resume()
//    }
//}
