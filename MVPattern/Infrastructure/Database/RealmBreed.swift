//
//  RealmBreed.swift
//  MVPattern
//
//  Created by Anthony Tran on 24/5/24.
//

import Foundation
import RealmSwift

final class RealmBreed: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: String
    @Persisted var breed: String
    @Persisted var subBreed: String?
    @Persisted var subBreeds: List<RealmBreed>
}

extension RealmBreed {
    static func primaryKey(entity: ConcreteBreed) -> String {
        "\(entity.breed);\(entity.subBreed ?? "")"
    }
}

extension RealmBreed {
    public convenience init(entity: BreedListItem) {
        self.init(entity: entity.concreteBreed)
        
        switch entity {
        case let .group(_, subBreeds):
            self.subBreeds = .init()
            self.subBreeds.append(objectsIn: subBreeds.map { .init(entity: $0) })
            
        case .concrete:
            self.subBreeds = .init()
        }
    }
    
    public convenience init(entity: ConcreteBreed) {
        self.init()
        self.id = RealmBreed.primaryKey(entity: entity)
        self.breed = entity.breed
        self.subBreed = entity.subBreed
    }
    
    public var concreteBreed: ConcreteBreed {
        .init(breed: breed, subBreed: subBreed)
    }
}
