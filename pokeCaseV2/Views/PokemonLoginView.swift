//
//  PokemonLoginView.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 2.08.2022.
//

import SwiftUI

struct PokemonLoginView: View {
    var body: some View {

        NavigationView{
            ZStack{
                Color.blue.ignoresSafeArea()
                VStack(alignment: .center){
                    Spacer()
                    Image("pokemonlogo")
                        .resizable()
                        .frame(width: 250, height: 100)
                    NavigationLink {
                        PokemonListView()
                    } label: {
                        Image("pokeball")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    Spacer()
                    
                    Text("Gotta Catch'Em All")
                        .padding(.top,100)
                        .font(.title3)
                        .foregroundColor(.white)

                }
            }
        }

    }
}

struct PokemonLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonLoginView()
    }
}
