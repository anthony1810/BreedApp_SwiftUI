//
//  TabbarFlow.swift
//  MVPattern
//
//  Created by Anthony Tran on 23/5/24.
//

import Foundation
import SwiftUI
import RealmSwift

struct TabbarFlow<Container: AppContainer>: View {
    
    let container: Container
    
    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    
    @Environment(\.appActions.breedList) private var breedListActions
    
    let flow: TabbarFlow<Container>
    
    var body: some View {
        TabView {
            BreedListFlow(container: flow.container)
                .tabItem {
                    Label("Breeds", systemImage: "dog")
                }
        }
    }
}
