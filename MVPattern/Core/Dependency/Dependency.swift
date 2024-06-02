//
//  Dependency.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation
import SwiftUI

protocol Dependency: ViewInjectable {
    associatedtype State: ViewInjectable
    associatedtype Actions: ViewInjectable
    
    var state: State { get }
    var actions: Actions { get }
}

extension Dependency {
    func inject(content: Content) -> some View {
        content
            .dependency(state)
            .dependency(actions)
    }
}
