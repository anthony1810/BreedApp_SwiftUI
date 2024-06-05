//
//  MockAppContainer.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation
import SwiftUI

final class MockAppContainer: MockDependencyContainer, AppContainer {
    struct Configuration {
        var breeds: BreedList
        var defaultImage: DogImageResouce?
        var favoriteItems: [FavoriteItem]
        
        init(breeds: BreedList = .mock,
             defaultImage: DogImageResouce? = .mock,
             favoriteItems: [FavoriteItem] = .mocks
        ) {
            self.breeds = breeds
            self.defaultImage = defaultImage
            self.favoriteItems = favoriteItems
        }
    }
    
    let configuration: Configuration
    var app: AppDependency
    
    init(configuration: Configuration) {
        self.configuration = configuration
        self.app = .init(state: .init(), actions: .init())
        
        if let resource = configuration.defaultImage {
            app.actions.dogImage.getImage = {_ in
                try? await Task.sleep(for: .seconds(1))
                return resource
            }
        }
    }
    
    func inject(content: Content) -> some View {
        content
            .dependency(app)
    }
    
    func makeBreedListScreenFactory() -> some BreedListScreenFactory {
        MockBreedListScreenFactory(breeds: configuration.breeds.map())
    }
    
    func makeFavoritesScreenFactory() -> some FavoritesScreenFactory {
        MockFavoritesScreenFactory(items: configuration.favoriteItems)
    }
}

extension MockDependencyContainer where Self == MockAppContainer {
    static func app(configuration: MockAppContainer.Configuration = .init(), configure: (Self) -> Void = { _ in }) -> Self {
        let container = Self(configuration: configuration)
        return container
    }
    
    static var app: Self {
        .app(configuration: .init())
    }
}
