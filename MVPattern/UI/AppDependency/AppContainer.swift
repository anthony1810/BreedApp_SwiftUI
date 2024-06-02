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
    
    associatedtype ScreenFactory: BreedListScreenFactory
    func makeBreedListScreenFactory() -> ScreenFactory
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
