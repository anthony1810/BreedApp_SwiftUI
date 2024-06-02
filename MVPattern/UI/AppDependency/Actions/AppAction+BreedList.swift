//
//  AppAction+BreedList.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation

extension AppActions {
    struct BreedList {
        var refresh: () async -> Void = emptyAction()
    }
}
