//
//  CitisApp.swift
//  Citis
//
//  Created by Paul Minyoo Kim on 2/6/25.
//

import SwiftUI

@main
struct CitisApp: App {
    @StateObject private var loginViewModel = LoginViewModel()
        
    var body: some Scene {
        WindowGroup {
            if loginViewModel.isLoggedIn {
                MainView()
                    .environmentObject(loginViewModel)
            } else {
                LoginScreen(viewModel: loginViewModel)
            }
        }
    }
}
