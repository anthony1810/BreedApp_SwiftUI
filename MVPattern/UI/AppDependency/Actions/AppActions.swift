//
//  AppActions.swift
//  MVPattern
//
//  Created by Anthony Tran on 20/5/24.
//

import Foundation
import SwiftUI
import OSLog

struct AppActions: ViewInjectable {
    struct Key: EnvironmentKey {
        static let defaultValue = AppActions()
    }
    
    var breedList = AppActions.BreedList()
    var dogImage = AppActions.DogImageGetter()
    var favorites = AppActions.Favorite()
    
    init() {}
    
    func inject(content: Content) -> some View {
        content
            .environment(\.appActions, self)
    }
}

extension EnvironmentValues {
    var appActions: AppActions {
        get { self[AppActions.Key.self] }
        set { self[AppActions.Key.self]  = newValue }
    }
}


private let log = Logger(subsystem: "me.apurin.actions", category: "Empty Action")

/// Empty action to be used as a default when initializing closures. When called outputs a reminder to set a proper closure.
public func emptyAction<each Input>(file: StaticString = #fileID, line: UInt = #line) -> (repeat each Input) -> Void {
    { (_: repeat each Input) -> Void in
        log.info("Executing empty action (defined in \(file):\(line))")
    }
}

/// Empty action to be used as a default when initializing closures. When called outputs a reminder to set a proper closure and returns `nil`.
public func emptyAction<each Input, Output>(file: StaticString = #fileID, line: UInt = #line) -> (repeat each Input) -> Output? {
    { (_: repeat each Input) -> Output? in
        log.info("Executing empty action (defined in \(file):\(line))")
        return nil
    }
}

/// Empty action to be used as a default when initializing closures. When called outputs a reminder to set a proper value and returns the provided value.
public func emptyAction<each Input, Output>(returning defaultValue: @autoclosure @escaping () -> Output, file: StaticString = #fileID, line: UInt = #line) -> (repeat each Input) -> Output {
    { (_: repeat each Input) -> Output in
        log.info("Executing empty action (defined in \(file):\(line))")
        return defaultValue()
    }
}

/// Empty action to be used as a default when initializing closures. When called outputs a reminder to set a proper closure and throws the provided error.
public func emptyAction<each Input, Output>(throwing error: @autoclosure @escaping () -> Error, file: StaticString = #fileID, line: UInt = #line) -> (repeat each Input) throws -> Output {
    { (_: repeat each Input) throws -> Output in
        log.info("Executing empty action (defined in \(file):\(line))")
        throw error()
    }
}
