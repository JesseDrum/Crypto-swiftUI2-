//
//  Crypto_swiftUI2_App.swift
//  Crypto(swiftUI2)
//
//  Created by Drum, Jesse on 5/2/22.
//

import SwiftUI

@main
struct Crypto_swiftUI2_App: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
