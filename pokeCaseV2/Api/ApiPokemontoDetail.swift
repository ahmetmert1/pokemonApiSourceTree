//
//  ApiPokemontoDetail.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 3.08.2022.
//

import Foundation


struct PokemonSelectedDetail: Codable {
    var sprites : PokemonSpritesDetail
    var stats: [StatElementDetail]
    var name : String
    var id : Int

}

struct PokemonSpritesDetail : Codable {
    var front_default: String?
    var back_female : String?
    var back_shiny : String?
    var back_shiny_female : String?
    var back_default : String?
    var front_female : String?
    var front_shiny : String?
    var front_shiny_female : String?
   
}

struct StatElementDetail : Codable {
    var base_stat, effort: Int?
    var stat: StatStatDetail
}

struct StatStatDetail : Codable {
    var name: String?
    var url: String?
}


class ApiPokemontoDetailClass {

    func detayVeriGetir(detayUrl : String, completion: @escaping (PokemonSelectedDetail) -> ()){

        guard let url = URL(string: detayUrl)else{
            return
        }

        URLSession.shared.dataTask(with: url){ data, response, error in

            guard let data = data else {
                return
            }


            let pokemonDetail = try! JSONDecoder().decode(PokemonSelectedDetail.self, from: data)
            

            DispatchQueue.main.async {
                completion(pokemonDetail)
            }


        }.resume()



    }//func sonu


}

//class ApiPokemontoDetailClass {
//
//    func getData(url: String, completion: @escaping (PokemonSelectedDetail) -> ()){
//
//        guard let url = URL(string: url) else {
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {
//                return
//            }
//
//            let pokemonDetail = try! JSONDecoder().decode(PokemonSelectedDetail.self, from: data)
//
//            DispatchQueue.main.async {
//                completion(pokemonDetail)
//            }
//
//        }.resume()
//
//    }
//
//
//}
