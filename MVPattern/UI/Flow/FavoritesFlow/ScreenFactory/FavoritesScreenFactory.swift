//
//  FavoritesScreenFactory.swift
//  MVPattern
//
//  Created by Anthony Tran on 5/6/24.
//

import Foundation
import SwiftUI

protocol FavoritesScreenFactory: ViewInjectable {
    associatedtype ScreenData: FavoritesScreenData
    func makeScreenData() -> ScreenData
}

struct MockFavoritesScreenFactory: FavoritesScreenFactory {
    let items: [FavoriteItem]
    
    func makeScreenData() -> some FavoritesScreenData {
        MockFavoritesScreenData(items: items)
    }
    
    func inject(content: Content) -> some View {
        content
    }
}
