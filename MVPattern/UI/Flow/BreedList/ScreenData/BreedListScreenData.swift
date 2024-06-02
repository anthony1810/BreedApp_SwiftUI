//
//  BreedListScreenData.swift
//  MVPattern
//
//  Created by Anthony Tran on 26/5/24.
//

import Foundation
import SwiftUI

protocol BreedListScreenData: DynamicProperty {
    typealias Breed = Breeds.Element
    
    associatedtype Breeds: RandomAccessCollection where Breed: Identifiable
    
    var breeds: Breeds? { get }
    
    func breed(_ breed: Breed) -> BreedListItem
}

struct MockBreedListScreenData: BreedListScreenData {
    struct Breed: Identifiable {
        var id: BreedListItem { breed }
        var breed: BreedListItem
    }
    
    var breeds: [Breed]?
    
    init(breeds: [BreedListItem]? = nil) {
        self.breeds = breeds.map { $0.map { .init(breed: $0)}}
    }
    
    func breed(_ breed: Breed) -> BreedListItem {
        breed.breed
    }
}
