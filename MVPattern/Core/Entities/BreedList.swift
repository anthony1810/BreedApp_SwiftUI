//
//  BreedList.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation

typealias BreedList = [Breed: [SubBreed]]

extension BreedList {
    static var mock: Self {
        [
            "affenpinscher": [],
            "african": [],
            "airedale": [],
            "akita": [],
            "appenzeller": [],
            "australian": [
                "shepherd"
            ],
        ]
    }
}
