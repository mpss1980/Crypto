//
//  CryptoApp.swift
//  Crypto
//
//  Created by Field on 04/01/25.
//

import SwiftUI

@main
struct CryptoApp: App {
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(homeViewModel)
        }
    }
}
