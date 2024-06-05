//
//  DogImage.swift
//  MVPattern
//
//  Created by Anthony Tran on 3/6/24.
//

import Foundation

enum DogImage: Hashable {
    case random
    case breed(ConcreteBreed)
}
