//
//  RealmBreedListScreenData.swift
//  MVPattern
//
//  Created by Anthony Tran on 30/5/24.
//

import Foundation
import RealmSwift

struct RealmBreedListScreenData: BreedListScreenData {
    @ObservedResults(RealmBreedList.self) var objects
    
    var breeds: RealmSwift.List<RealmBreed>? {
        objects.first?.breeds
    }
    
    func breed(_ breed: RealmBreed) -> BreedListItem {
        .init(object: breed)
    }
}
