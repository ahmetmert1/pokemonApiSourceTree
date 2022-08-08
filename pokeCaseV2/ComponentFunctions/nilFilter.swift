//
//  nilFilter.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 3.08.2022.
//

import Foundation

//class nilFiltreleClass {
    
    
    
    func nilFiltrele(veri : PokemonSpritesDetail) -> [String]{
        
        var nilsizDizi : [String] = []
        
        if veri.back_default != nil{
            nilsizDizi.append(veri.back_default!)
        }
        if veri.back_female != nil {
            nilsizDizi.append(veri.back_female!)
        }
        if veri.back_shiny != nil {
            nilsizDizi.append(veri.back_shiny!)
        }
        if veri.back_shiny_female != nil {
            nilsizDizi.append(veri.back_shiny_female!)
        }
        if veri.front_default != nil {
            nilsizDizi.append(veri.front_default!)
        }
        if veri.front_female != nil {
            nilsizDizi.append(veri.front_female!)
        }
        if veri.front_shiny != nil {
            nilsizDizi.append(veri.front_shiny!)
        }
        if veri.front_shiny_female != nil {
            nilsizDizi.append(veri.front_shiny!)
        }
        
        
        
        
        return nilsizDizi
        
    }
    
    
//}
