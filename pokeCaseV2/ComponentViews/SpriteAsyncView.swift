//
//  SpriteAsyncView.swift
//  newPokemon
//
//  Created by Ahmet Mert ÖZ on 3.08.2022.
//

import SwiftUI

struct SpriteAsyncView: View {
    
    @State var spriteUrl : String
    
    
    
    var body: some View {

        Text("Async Image")

    }
}

struct SpriteAsyncView_Previews: PreviewProvider {
    static var previews: some View {
        SpriteAsyncView(spriteUrl: "")
    }
}
