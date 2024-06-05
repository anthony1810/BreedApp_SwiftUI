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
        FavoritesFlowContent(flow: self)
            .dependency(container)
    }
}

struct FavoritesFlowContent<Container: AppContainer>: View {
    
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
