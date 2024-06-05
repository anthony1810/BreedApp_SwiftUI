//
//  FavoritesScreen.swift
//  MVPattern
//
//  Created by Anthony Tran on 5/6/24.
//

import SwiftUI

struct FavoritesScreen<Factory: FavoritesScreenFactory>: View {
    
    let factory: Factory
    
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
    }
}

#Preview {
    WithMockContainer(.app) { container in
        FavoritesScreen(factory: container.makeFavoritesScreenFactory())
    }
}
