//
//  DogImageFavoriteButton.swift
//  MVPattern
//
//  Created by Anthony Tran on 3/6/24.
//

import SwiftUI

struct DogImageFavoriteButton: View {
    let resource: DogImageResouce?
    
    @StateObject private var state = FavoriteState()
    @Environment(\.appActions.favorites) private var favoriteActions
    
    var body: some View {
        Button {
            guard let resource else { return }
            if state.isFavorited {
                favoriteActions.unfavorite(resource)
            } else {
                favoriteActions.favorite(resource)
            }
        } label: {
            Label(state.isFavorited ? "Unfavorite" : "Favorite", systemImage: "star")
                .labelStyle(.iconOnly)
                .symbolVariant(state.isFavorited ? .fill : .none)
        }
        .buttonStyle(.borderedProminent)
        .disabled(!state.canFavorite)
        .padding()
        .onFirstAppear {
            guard let resource else { return }
            favoriteActions.connect(state, resource)
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        DogImageScreen(image: .random)
    }
}

public final class FavoriteState: ObservableObject {
    @Published public var canFavorite = false
    
    @Published public var isFavorited = false
    
    public init() { }
}
