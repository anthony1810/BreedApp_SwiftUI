//
//  BreedListScreenFactory.swift
//  MVPattern
//
//  Created by Anthony Tran on 26/5/24.
//

import Foundation
import SwiftUI

protocol BreedListScreenFactory: ViewInjectable {
    associatedtype ScreenData: BreedListScreenData
    func makeScreenData() -> ScreenData
}

struct MockBreedListScreenFactory: BreedListScreenFactory {
    let breeds: [BreedListItem]?
    
    func makeScreenData() -> some BreedListScreenData {
        MockBreedListScreenData(breeds: breeds)
    }
    
    func inject(content: Content) -> some View {
        content
    }
}
