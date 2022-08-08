//
//  getSubstring.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 4.08.2022.
//

import Foundation


func pokemonIdBul(gelenUrl: String) -> String {

let basla = gelenUrl.index(gelenUrl.startIndex, offsetBy: 73)
let bitir = gelenUrl.index(gelenUrl.endIndex, offsetBy: -4)

let sonuc = gelenUrl[basla ..< bitir]
    

print(type(of: sonuc))

let stringSonuc = String(sonuc)
print(type(of: stringSonuc))
fatalError()
return stringSonuc
}

//https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png
