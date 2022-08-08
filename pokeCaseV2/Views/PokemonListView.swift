//
//  ContentView.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 2.08.2022.
//

import SwiftUI

struct PokemonListView: View {
    
    @ObservedObject var pokemonListData = PokemonApitoListing()
    @State var searchText = ""
    
    
    //var item = veriFiltreleClass().veriFiltrele(aramaStringi: searchText, gelenVeri: pokemonListData.data)
    
    var filtrelenenVeri : [PokemonEntry]{
        if (searchText == ""){
            return pokemonListData.data
        }else{
            return pokemonListData.data.filter{
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    

    
    var body: some View {

        List(0..<filtrelenenVeri.count, id: \.self){i in
            
            if i == self.filtrelenenVeri.count - 1{
                NavigationLink {
                    PokemonDetayView(pokemonUrl: "\(filtrelenenVeri[i].url)")
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(i+1).png"))
                        ListCellView(data: filtrelenenVeri[i], isLast: true, listData: self.pokemonListData)
                            .padding()
                    }
                }
                
            }else{
                NavigationLink {
                    PokemonDetayView(pokemonUrl: "\(filtrelenenVeri[i].url)")
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(i+1).png"))
                        ListCellView(data: filtrelenenVeri[i], isLast: false, listData: self.pokemonListData)
                            .padding()
                    }
                }
            }
        }
        .listStyle(.grouped)
        .searchable(text: $searchText, prompt: "searchBarText")
        .navigationTitle("mainTitle")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
