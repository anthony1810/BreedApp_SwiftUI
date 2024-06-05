//
//  AppContainer.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation
import SwiftUI

protocol AppContainer: DependencyContainer {
    var app: AppDependency { get }
    
    associatedtype ConcreteBreedListScreenFactory: BreedListScreenFactory
    func makeBreedListScreenFactory() -> ConcreteBreedListScreenFactory
    
    associatedtype ConcreteFavoritesScreenFactory: FavoritesScreenFactory
    func makeFavoritesScreenFactory() -> ConcreteFavoritesScreenFactory
}

extension AppContainer {
    public func inject(content: Content) -> some View {
        content
            .dependency(app)
    }
    
    public var app: some View {
        TabbarFlow(container: self)
    }
}
