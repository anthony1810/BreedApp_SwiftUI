//
//  RealmBreedListScreenFactory.swift
//  MVPattern
//
//  Created by Anthony Tran on 30/5/24.
//

import Foundation
import SwiftUI
import RealmSwift

struct RealmBreedListScreenFactory: BreedListScreenFactory {
    let realmConfiguration: Realm.Configuration
    
    init(realmConfiguration: Realm.Configuration) {
        self.realmConfiguration = realmConfiguration
    }
    
    func makeScreenData() -> some BreedListScreenData {
        RealmBreedListScreenData()
    }
    
    func inject(content: Content) -> some View {
        content
            .environment(\.realmConfiguration, realmConfiguration)
    }
    
}
