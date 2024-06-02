//
//  BreedListScreen.swift
//  MVPattern
//
//  Created by Anthony Tran on 26/5/24.
//

import SwiftUI

struct BreedListScreen<Factory: BreedListScreenFactory>: View {
    
    let factory: Factory
    @Environment(\.appActions.breedList) private var breedActions
    
    var body: some View {
        WithProperty(factory.makeScreenData()) { screenData in
            List {
                if let breeds = screenData.breeds {
                    ForEach(breeds) { breed in
                        BreedListRow(item: screenData.breed(breed))
                    }
                }
            }
        }
        .task {
            await breedActions.refresh()
        }
        .refreshable {
            await breedActions.refresh()
        }
        .dependency(factory)
    }
}

#Preview {
    WithMockContainer(.app) { container in
        BreedListScreen(factory: container.makeBreedListScreenFactory())
    }
}
