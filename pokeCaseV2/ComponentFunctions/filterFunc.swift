//
//  filterFunc.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 2.08.2022.
//

import Foundation

class veriFiltreleClass{
    
    
func veriFiltrele(aramaStringi: String,gelenVeri: [PokemonEntry])->[PokemonEntry]{
    
    if aramaStringi == "" {
        return gelenVeri
    }else{
        return gelenVeri.filter{
            $0.name.lowercased().contains(aramaStringi.lowercased())
        }
    }
    }
    
    
}
