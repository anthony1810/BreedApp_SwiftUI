//
//  SettingsScreen.swift
//  MVPattern
//
//  Created by Anthony Tran on 7/6/24.
//

import SwiftUI

struct SettingsScreen: View {
    
    @Environment(\.appActions.favorites) private var favorites
    
    @State private var showResetFavoriteDialog = false
    
    var body: some View {
        List {
            Section("Favorites") {
                Button("Reset Favorites", role: .destructive) {
                    showResetFavoriteDialog = true
                }
                .confirmationDialog("Reset Favorites?", isPresented: $showResetFavoriteDialog) {
                    Button("Reset Favorites", role: .destructive) {
                        favorites.reset()
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
