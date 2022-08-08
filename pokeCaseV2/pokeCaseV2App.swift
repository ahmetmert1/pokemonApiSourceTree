//
//  pokeCaseV2App.swift
//  pokeCaseV2
//
//  Created by Ahmet Mert ÖZ on 5.08.2022.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct pokeCaseV2App: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            PokemonLoginView().environment(\.locale, .autoupdatingCurrent)
        }
    }
}
