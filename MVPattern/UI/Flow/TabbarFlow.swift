//
//  TabbarFlow.swift
//  MVPattern
//
//  Created by Anthony Tran on 23/5/24.
//

import Foundation
import SwiftUI
import RealmSwift

struct TabbarFlow<Container: AppContainer>: View {
    
    let container: Container
    
    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    
    @Environment(\.appActions.breedList) private var breedListActions
    @AppStorage(SettingsKey.Welcome.didShow) private var didShowWelcome = false
    
    let flow: TabbarFlow<Container>
    
    var body: some View {
        ZStack {
            if didShowWelcome {
                TabView {
                    RandomImageFlow(container: flow.container)
                        .tabItem {
                            Label("Random", systemImage: "photo")
                        }
                    
                    BreedListFlow(container: flow.container)
                        .tabItem {
                            Label("Breeds", systemImage: "dog")
                        }
                    
                    FavoritesFlow(container: flow.container)
                        .tabItem {
                            
                            Label("Favorites", systemImage: "star")
                        }
                    
                    SettingsFlow(container: flow.container)
                        .tabItem {
                            Label("Settings", systemImage: "gear")
                        }
                }
                .transition(.asymmetric(insertion: .slide, removal: .scale))
            } else {
                WelcomeScreen()
                    .transition(.asymmetric(insertion: .slide, removal: .scale))
            }
        }
        .animation(.bouncy, value: didShowWelcome)
    }
}

#Preview {
    WithMockContainer(.app) { container in
        TabbarFlow(container: container)
    }
}
