//
//  FavoritesScreen.swift
//  MVPattern
//
//  Created by Anthony Tran on 5/6/24.
//

import SwiftUI

struct FavoritesScreen<Factory: FavoritesScreenFactory>: View {
    
    let factory: Factory
    @AppStorage(SettingsKey.Favorites.prefersFill) var prefersFill = false
    
    var body: some View {
        WithProperty(factory.makeScreenData()) { screenData in
            if screenData.items.isEmpty {
                ContentUnavailableView("No Favorites", systemImage: "star")
                    .symbolVariant(.slash.fill)
            } else {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 200))]) {
                        ForEach(screenData.items) { item in
                            FavoritesGridItem(item: screenData.item(item))
                        }
                    }
                }
            }
        }
        .toolbar(content: {
            leftToolBarContent
        })
    }
    
    var leftToolBarContent: some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: {
                prefersFill.toggle()
            }, label: {
                Label(
                    prefersFill ? "Fit" : "Fill",
                    systemImage: prefersFill 
                    ? "arrow.down.right.and.arrow.up.left"
                    : "arrow.up.left.and.arrow.down.right"
                )
            })
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        FavoritesScreen(factory: container.makeFavoritesScreenFactory())
    }
}
