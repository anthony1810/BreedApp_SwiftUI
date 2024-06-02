//
//  BreedListFlow.swift
//  MVPattern
//
//  Created by Anthony Tran on 30/5/24.
//

import Foundation
import SwiftUI

struct BreedListFlow<Container: AppContainer> : View {
    
    let container: Container
    var body: some View {
        _Content(flow: self)
            .dependency(container)
    }
}

private struct _Content<Container: AppContainer>: View {
    
    let flow: BreedListFlow<Container>
    
    var body: some View {
        BreedListScreen(factory: flow.container.makeBreedListScreenFactory())
    }
}
