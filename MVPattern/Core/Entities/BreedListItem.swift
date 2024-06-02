//
//  BreedListItem.swift
//
//
//  Created by Mikhail Apurin on 2024-02-12.
//

import Foundation

enum BreedListItem: Hashable {
    case group(breed: ConcreteBreed, subBreeds: [ConcreteBreed])
    
    case concrete(ConcreteBreed)
    
    var concreteBreed: ConcreteBreed {
        switch self {
        case let .group(breed, _), let .concrete(breed):
            return breed
        }
    }
    
    var breed: Breed {
        concreteBreed.breed
    }
    
    public init(object: RealmBreed) {
        if object.subBreeds.isEmpty {
            self = .concrete(object.concreteBreed)
        } else {
            self = .group(breed: object.concreteBreed, subBreeds: object.subBreeds.map(\.concreteBreed))
        }
    }
}

extension BreedList {
    func map() -> [BreedListItem] {
        reduce(into: []) { partialResult, item in
            let breed = ConcreteBreed(breed: item.key, subBreed: nil)
            if item.value.isEmpty {
                partialResult.append(.concrete(breed))
            } else {
                let subBreeds = item.value
                    .sorted { $0.localizedStandardCompare($1) == .orderedAscending }
                    .map { ConcreteBreed(breed: breed.breed, subBreed: $0) }
                partialResult.append(.group(breed: breed, subBreeds: subBreeds))
            }
        }
        .sorted { $0.breed.localizedStandardCompare($1.breed) == .orderedAscending }
    }
}
