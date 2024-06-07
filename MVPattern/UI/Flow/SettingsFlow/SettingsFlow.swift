//
//  SettingsFlow.swift
//  MVPattern
//
//  Created by Anthony Tran on 7/6/24.
//

import Foundation
import SwiftUI

struct SettingsFlow<Container: AppContainer>: View {
    
    let container: Container
    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    let flow: SettingsFlow<Container>
    
    var body: some View {
        NavigationStack {
            SettingsScreen()
                .navigationTitle("Settings")
        }
    }
}

#Preview {
    WithMockContainer(.app) { container in
        SettingsFlow(container: container)
    }
}
