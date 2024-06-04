//
//  AppActions+Favorites.swift
//  MVPattern
//
//  Created by Anthony Tran on 3/6/24.
//

import Foundation
extension AppActions {
    struct Favorite {
        var connect: (FavoriteState, DogImageResouce) -> Void = emptyAction()
        
        var favorite: (DogImageResouce) -> Void = emptyAction()
        
        var reset: () -> Void = emptyAction()
        
        var unfavorite: (DogImageResouce) -> Void = emptyAction()
    }
}
