//
//  CryptoApp.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//

import SwiftUI

@main
struct CryptoApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(homeView: HomeViewFactory.create())
                    .navigationBarHidden(true)
            }
        }
    }
}
