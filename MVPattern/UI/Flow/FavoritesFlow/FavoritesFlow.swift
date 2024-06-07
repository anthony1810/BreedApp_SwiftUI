//
//  FavoritesFlow.swift
//  MVPattern
//
//  Created by Anthony Tran on 5/6/24.
//

import Foundation
import SwiftUI

struct FavoritesFlow<Container: AppContainer>: View {
    
    let container: Container
    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    
    let flow: FavoritesFlow<Container>
    
    var body: some View {
        NavigationStack {
            FavoritesScreen(factory: flow.container.makeFavoritesScreenFactory())
                .navigationTitle("Favorites")
                .navigationDestination(for: ScreenDestination.self) { destination in
                    switch destination {
                    case let .breedImage(breed):
                        DogImageScreen(image: DogImage.breed(breed))
                            .navigationTitle(breed.formatted(.breedName))
                    }
                }
        }
    }
}
