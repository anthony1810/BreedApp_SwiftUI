//
//  OnFirstAppear.swift
//  MVPattern
//
//  Created by Anthony Tran on 3/6/24.
//

import Foundation
import SwiftUI

struct OnFirstAppear: ViewModifier {
    @State private var didAppear = false
    
    let action: () -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !didAppear else { return }
                didAppear = true
                action()
            }
    }
}

extension View {
    func onFirstAppear(perform action: @escaping () -> Void) -> some View {
        modifier(OnFirstAppear(action: action))
    }
}
