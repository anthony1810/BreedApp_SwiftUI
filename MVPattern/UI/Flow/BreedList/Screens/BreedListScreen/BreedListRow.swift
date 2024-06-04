//
//  BreedListRow.swift
//  MVPattern
//
//  Created by Anthony Tran on 1/6/24.
//

import Foundation
import SwiftUI

struct BreedListRow: View {
    
    let item: BreedListItem
    
    @State private var isExpanded = true
    
    var body: some View {
        switch item {
        case let .group(breed, subBreeds):
            DisclosureGroup(
                isExpanded: $isExpanded,
                content: {
                    ForEach(subBreeds, id: \.self) { subBreed in
                        NavigationLink(value: BreedListScreenDestination.breedImage(breed: subBreed)) {
                            if let sub = subBreed.subBreed {
                                Text(sub)
                            } else {
                                Text(subBreed.breed)
                            }
                        }
                    }
                },
                label: {
                   NavigationLink(
                    value: BreedListScreenDestination.breedImage(breed: breed),
                    label: {
                        Text(breed.breed)
                    }
                   )
                }
            )
        case let .concrete(breed):
            NavigationLink(
                value: BreedListScreenDestination.breedImage(breed: breed),
                label: { Text(breed.breed) }
            )
        }
    }
}

#Preview {
    List {
        BreedListRow(item: .concrete(.init(breed: "Shiba", subBreed: nil)))
        BreedListRow(item: .group(
            breed: .init(breed: "Poodle", subBreed: nil),
            subBreeds: [
                .init(breed: "Beggie", subBreed: "Toy")
            ])
        )
    }
}
