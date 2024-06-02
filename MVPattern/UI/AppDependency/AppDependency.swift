//
//  AppDependency.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation
import SwiftUI

struct AppDependency: Dependency {
    var state: AppState
    var actions: AppActions
    
    init(state: AppState, actions: AppActions) {
        self.state = state
        self.actions = actions
    }
}
