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
        
        init(breeds: BreedList = .mock) {
            self.breeds = breeds
        }
    }
    
    let configuration: Configuration
    var app: AppDependency
    
    init(configuration: Configuration) {
        self.configuration = configuration
        self.app = .init(state: .init(), actions: .init())
    }
    
    func inject(content: Content) -> some View {
        content
            .dependency(app)
    }
    
    func makeBreedListScreenFactory() -> some BreedListScreenFactory {
        MockBreedListScreenFactory(breeds: configuration.breeds.map())
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
