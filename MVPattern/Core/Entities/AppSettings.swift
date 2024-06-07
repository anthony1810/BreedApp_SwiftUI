//
//  AppSettings.swift
//  MVPattern
//
//  Created by Anthony Tran on 7/6/24.
//

import Foundation
enum SettingsKey {}

extension SettingsKey {
    enum Welcome {
        static let didShow = "Welcome/didShow"
    }
}

extension SettingsKey {
    enum Favorites {
        static let prefersFill = "Favorites/prefersFill"
    }
}
