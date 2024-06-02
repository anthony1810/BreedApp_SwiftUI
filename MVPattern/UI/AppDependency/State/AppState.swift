//
//  AppState.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation
import SwiftUI

struct AppState: ViewInjectable {
    var errorAlert = ErrorAlert()
    
    init() { }
    
    func inject(content: Content) -> some View {
        content
            .environmentObject(errorAlert)
    }
}
