//
//  RealmBreedList.swift
//  MVPattern
//
//  Created by Anthony Tran on 24/5/24.
//

import Foundation
import RealmSwift

final class RealmBreedList: Object, ObjectKeyIdentifiable {
    @Persisted var breeds: List<RealmBreed>
}
