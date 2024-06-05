//
//  BreedListFlow.swift
//  MVPattern
//
//  Created by Anthony Tran on 30/5/24.
//

import Foundation
import SwiftUI

struct BreedListFlow<Container: AppContainer>: View {
    let container: Container
    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    let flow: BreedListFlow<Container>
    
    var body: some View {
        NavigationStack {
            BreedListScreen(
                factory: flow
                    .container
                    .makeBreedListScreenFactory()
            )
            .navigationTitle("Breeds")
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
    
// MARK: - Navigations
enum ScreenDestination: Hashable {
    case breedImage(breed: ConcreteBreed)
}
    
