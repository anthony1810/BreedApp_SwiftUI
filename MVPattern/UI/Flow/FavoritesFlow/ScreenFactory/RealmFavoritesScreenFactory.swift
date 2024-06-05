//
//  RealmFavoritesScreenFactory.swift
//  MVPattern
//
//  Created by Anthony Tran on 5/6/24.
//

import Foundation
import RealmSwift
import SwiftUI

struct RealmFavoritesScreenFactory: FavoritesScreenFactory {
    let realmConfiguration: Realm.Configuration
    
    init(realmConfiguration: Realm.Configuration) {
        self.realmConfiguration = realmConfiguration
    }
    
    func makeScreenData() -> some FavoritesScreenData {
        RealmFavoritesScreenData()
    }
    
    func inject(content: Content) -> some View {
        content
            .environment(\.realmConfiguration, realmConfiguration)
    }
}
