//
//  SettingsScreen.swift
//  MVPattern
//
//  Created by Anthony Tran on 7/6/24.
//

import SwiftUI

struct SettingsScreen: View {
    
    @Environment(\.appActions.favorites) private var favorites
    @AppStorage(SettingsKey.Welcome.didShow) private var didShowWelcome = false
    
    @State private var showResetFavoriteDialog = false
    @State private var showResetWelcomeDialog = false
    
    var body: some View {
        List {
            Section("App Settings") {
                Button("Reset Favorites", role: .destructive) {
                    showResetFavoriteDialog = true
                }
                .confirmationDialog("Reset Favorites?", isPresented: $showResetFavoriteDialog) {
                    Button("Reset Favorites", role: .destructive) {
                        favorites.reset()
                    }
                }
                Button("Show Welcome Screen") {
                    showResetWelcomeDialog = true
                }
                .confirmationDialog("Reset Welcome Screen?", isPresented: $showResetWelcomeDialog) {
                    Button("Show Welcome Screen") {
                        didShowWelcome = false
                    }
                }
            }
            
            Section("SwiftUI MV Sample") {
                LabeledContent("Version", value: version)
            }
        }
    }
    
    var version: String {
        let bundle = Bundle.main
        let version = bundle.infoDictionary?["CFBundleVersion"] ?? "0"
        let shortVersion = bundle.infoDictionary?["CFBundleShortVersionString"] ?? "0"
        return "\(shortVersion) (\(version))"
    }
}

#Preview {
    WithMockContainer(.app) { container in
        SettingsScreen()
    }
}
