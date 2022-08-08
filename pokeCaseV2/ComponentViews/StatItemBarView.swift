//
//  StatItemBarView.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 3.08.2022.
//

import SwiftUI

struct StatItemBarView: View {
    
    @State var barDegeri : Int = 0
//    @Binding private var  bilgiler : PokemonSelectedDetail?

    
    
    var body: some View {
        

        ZStack(alignment: .leading) {
            Capsule(style: .circular)
                .inset(by:0)
                .fill(Color.gray)
                .frame(width: 150, height: 15)
            
            Capsule()
                .inset(by:0)
                .fill(Color.red)
                .frame(width: 1*CGFloat(barDegeri), height: 15)
            
        }.padding(5)

    }
}

struct StatItemBarView_Previews: PreviewProvider {
    static var previews: some View {
        StatItemBarView()
    }
}
