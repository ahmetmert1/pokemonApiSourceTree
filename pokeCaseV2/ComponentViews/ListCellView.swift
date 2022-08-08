//
//  ListCellView.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 2.08.2022.
//

import SwiftUI

struct ListCellView: View {
    
    var data : PokemonEntry
    var isLast : Bool
    
    @ObservedObject var listData : PokemonApitoListing
    
    var body: some View {

        VStack(alignment: .leading){
            if isLast == true {
                Text(data.name.capitalized)
                    .bold()
                    .onAppear{
                        print("Yeni Veriler Yükleniyor")
                        self.listData.updateData()
                    }
            }else{
                Text(data.name.capitalized)
                    .bold()
                
            }
            
            
            
            Text(data.url)
                .font(.caption)
            Text("\(data.id)")
                .font(.caption2)
        }

    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView(data: PokemonEntry(name: "pikhacu", url: "soıdasdkfhsakdjhfjk"), isLast: Bool.init(true), listData: PokemonApitoListing())
    }
}
