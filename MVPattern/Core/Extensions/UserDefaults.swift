//
//  UserDefaults.swift
//  MVPattern
//
//  Created by Anthony Tran on 7/6/24.
//

import Foundation
extension UserDefaults {
    static func mock(name: String = UUID().uuidString) -> UserDefaults {
        let defaults = UserDefaults(suiteName: name)!
        defaults.removePersistentDomain(forName: name)
        return defaults
    }
}
